Ingress provides an HTTP/HTTPS entry point to the Kubernetes cluster and operates at the application layer (L7).
It routes external traffic to internal services based on hostnames and URL paths, while services remain internal (ClusterIP).
This approach enables domain-based routing, TLS termination, centralized access control, and clean separation between networking and application layers.
Using Ingress reflects production-ready Kubernetes architecture commonly used in Data Center environments.

Internet
  ↓
Ingress Controller (NGINX)
  ↓
Service (ClusterIP)
  ↓
Pod

🧠 Key benefits
Single entry point to the cluster
Host-based routing (e.g. shop.local)
HTTPS / TLS termination
Load balancing across multiple replicas
Easier scalability and cleaner architecture

ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: onlineboutique
spec:
  rules:
  - host: shop.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: frontend
            port:
              number: 80

kubectl apply -f ingress.yaml
kubectl get ingress
kubectl describe ingress onlineboutique

+ Add to etc hosts:
/etc/hosts
IP_INGRESS_CONTROLLER  shop.local



###
Scaling Application:
kubectl scale deployment frontend --replicas=5

or declaratively:
spec:
  replicas: 5
