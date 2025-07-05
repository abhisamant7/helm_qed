Below steps

aws eks describe-cluster --name Msgapptest-cluster --query "cluster.identity.oidc.issuer" --output text

https://oidc.eks.us-east-1.amazonaws.com/id/8B28C159AC2FD24480BCB94B3EB5AD6C


eksctl utils associate-iam-oidc-provider --cluster Msgapptest-cluster --approve

aws iam create-policy --policy-name amazonEKS_EFS_msgtest_policy --policy-document file://iam-policy-example.json

amazonEKS_EFS_msgtest_policy

aws iam create-role \
  --role-name AmazonEKS_EFS_CSI_msgtest_DriverRole \
  --assume-role-policy-document file://"aws-efs-csi-driver-trust-policy.json"



aws iam attach-role-policy --policy-arn arn:aws:iam::771725601998:policy/amazonEKS_EFS_msgtest_policy  --role-name AmazonEKS_EFS_CSI_msgtest_DriverRole


kubectl apply -f efs-service-account.yaml

kubectl apply -f public-ecr-driver.yaml



helm upgrade --install aws-efs-csi-driver --namespace kube-system aws-efs-csi-driver/aws-efs-csi-driver \
--set controller.serviceAccount.create=false \
--set controller.serviceAccount.name=efs-csi-controller-sa

https://stackoverflow.com/questions/76254089/how-to-assign-domain-name-to-aws-load-balancer




============
Aws ingress controller 

https://medium.com/tensult/alb-ingress-controller-on-aws-eks-45bf8e36020d

https://aws.amazon.com/blogs/opensource/kubernetes-ingress-aws-alb-ingress-controller/

https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html

https://aws.amazon.com/blogs/containers/exposing-kubernetes-applications-part-2-aws-load-balancer-controller/

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicysandbox \
    --policy-document file://iam_policy.json

eksctl create iamserviceaccount \
  --cluster=Msgapptest-cluster \
  --namespace=kube-system \
  --name=alb-ingress-controller \
  --attach-policy-arn=arn:aws:iam::771725601998:policy/AWSLoadBalancerControllerIAMPolicysandbox \
  --override-existing-serviceaccounts \
  --approve

curl -sS "https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/alb-ingress-controller.yaml" \
     | sed "s/# - --cluster-name=Msgapptest-cluster/- --cluster-name=Msgapptest-cluster/g" \
     | kubectl apply -f -




aws iam create-role \
  --role-name AmazonEKSLoadBalancerControllerRole_sandbox \
  --assume-role-policy-document file://"load-balancer-role-trust-policy.json"


aws iam attach-role-policy \
  --policy-arn arn:aws:iam::771725601998:policy/AWSLoadBalancerControllerIAMPolicysandbox \
  --role-name AmazonEKSLoadBalancerControllerRole_sandbox



helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=Msgapptest-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=alb-ingress-controller 



 kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v1.12.3/cert-manager.yaml


kubectl apply -f v2_5_4_full.yaml

========================


O5sTliF1oP9er2jke

kubectl get 

kubernetes.io/role/elb  1
kubernetes.io/cluster/qed-prod-cluster  shared
