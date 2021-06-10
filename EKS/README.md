#### EKS CLOUDFORMATION DEPLOY

Using AWS CloudFormation Template to deploy EKS in Amazon Web Service.

The directory contains two templates inorder to deploy the EKS stack in AWS.
The controlplane is being deployed under an environment where there is no access to Internet inorder for the
nodegroups to join the cluster. To be precised the nodegroups are being deployed using private subnet where there is no NAT inorder to provide an access to the internet, the kubelet running in the node can't join the APIServer of the controlplane if made public as i mentioned there is no NAT.

Through terraform we can handle this issue as terraform do support manipulating controlplane API, whereas cloudformation till date didn't provided their support for this.

Thereby i made use of a workaround which is basically a bash script that constantly queries the EKS Endpoint until the controlplane gets active, and it too does a update on the controlplane VPC Configuration inorder to change the APIServer endpoint and make it private which is public by default. I have made use of recursion in my bash script.
