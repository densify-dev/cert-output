# Outputting Host Certificate

1. Edit `cert-output-pod.yaml` to add the value of `TESTHOST` environment variable (mandatory), and optionally `TESTPORT` if you require port other than 443.

2. Run the pod:

    `kubectl create -f cert-output-pod.yaml -n <namespace>`

	Once the certificate has been retrieved and printed out, the pod exits.

3. Review the log for the container

	`kubectl logs cert-output -n <namespace>`

	The log should print out the certificate and openssl log trying to retrieve it, examine the output for any errors.

4. Cleanup

    `kubectl delete -f cert-output-pod.yaml.yaml -n <namespace>`
