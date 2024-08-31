MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/:/+++"

--/:/+++
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash

# In multipart MIME format to support EKS appending to it

${before_cluster_joining_userdata}

%{ if length(kubelet_extra_args) > 0 }
export KUBELET_EXTRA_ARGS="${kubelet_extra_args}"
%{ endif }
%{ if length(kubelet_extra_args) > 0 || length (bootstrap_extra_args) > 0 || length (after_cluster_joining_userdata) > 0 }

/etc/eks/bootstrap.sh --apiserver-endpoint '${cluster_endpoint}' --b64-cluster-ca '${certificate_authority_data}' ${bootstrap_extra_args} '${cluster_name}'

${after_cluster_joining_userdata}
%{ endif }

--/:/+++--


MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="//"

--//
Content-Type: application/node.eks.aws

---
apiVersion: node.eks.aws/v1alpha1
kind: NodeConfig
spec:
  cluster:
    apiServerEndpoint: https://AF54F450A50EA6F429EF5FA38C9A7AE4.yl4.ap-south-1.eks.amazonaws.com
    certificateAuthority: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJVy9iaDNhSzB5Ukl3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRBNE16RXdPREUxTlRCYUZ3MHpOREE0TWprd09ESXdOVEJhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUUM5RC9Yb25FK3A5TERsWnV6Vk5qREpEYXdrZjJCMlRWTGZZVUZGWFdUUjQ1bjRKd0JadllIcG1SeFYKeVgwVVV3K0ZYODN1R1JLRXdXMmN4Q0lhbUV0cnQ4T0ZlZjNLVlgxVjNMeEJraU5QUEI0VVB5OHVnYnVyQlhabgpyVEtUMnozTFRSZVJYWmNKamh6T1Y0cUVQbGx1RGxSSnYzRjcvUVZjSGE2aXZSYkZGYlVsR015anBVVmdBYXNQCkEzWDBPSGJwam9lcDk3WHhWNE9tZDNiMVNhSVBQOVg4S3FUOXN4NzVTelBYQXRLZWw3S085Y2plV2RJaVZXbzUKQ0wvWDlWOVI4NVJDVXE0UVEwcHRKMkZkdzhoSTVIeS8rZU1IUnFiZ3libWJ3ZmUxMUtlcjNEaHM2d1RJcEpwdQp2SWVMeW5xS2I4TDNQMXNISjlvWkVGTzhZOHFaQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJSMm8vVGxDVDc4TDFXbi9NK3FlbHY3cHRQellqQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQUo0Wnh3bXEyMwptdVIxZmgza3NRVHJkbTdxa1BFYXNMeE56aktmSWQ4Q0duakpTNC9JT3FLVjFKRFRpK3R2QWxhYkxEeUxDMzJDCnpoMjlSYk5vaFV1SU1KOEpHSmF5UFlyQS9zV2RuVjdkRWo5QSt0NVp2R3NZZTNGOXRDTkVwcEgwVjNjaVZPMUEKMXdlckd2YTgyRUE5Y3E1MmtOZHZiUlVFRXByUTA3NWpBdzY3RmhzdXZHdzJpa2FJYTZaMmIySzU3SUlPbEJGTgpLZ3lJRkFsaCtyS3lZd1pYOHpyQVNWdFVPNGRJU0pvemVuTUNldkthN1I4cjVBRUxKcVMyWWpLSXlIbjVJclhGCjY3dGlPTVI3N2J4OFZCdGd3UDJxU0ZjNzdKczJBR0V0VXpxeFNuWG9aSEwwZUZXSm43dDhnVjV6SmNyR3VlQk4KRkdtM0syY1pRTk52Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    cidr: 172.20.0.0/16
    name: cluster
  kubelet:
    config:
      maxPods: 29
      clusterDNS:
      - 172.20.0.10
    flags:
    - "--node-labels=eks.amazonaws.com/sourceLaunchTemplateVersion=1,eks.amazonaws.com/nodegroup-image=ami-0cb85744ea26dbab1,eks.amazonaws.com/capacityType=ON_DEMAND,eks.amazonaws.com/nodegroup=workers-antelope,eks.amazonaws.com/sourceLaunchTemplateId=lt-0a57fb80f9acd5eff"

--//--