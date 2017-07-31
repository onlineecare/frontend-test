#!/bin/bash

echo "Updating deployment image for frontend-test"
echo "~/.kube/kubectl set image deployment/${KUBERNETES_SERVICE_NAME} ${KUBERNETES_SERVICE_NAME}=${DOCKER_REGISTRY_URL}/${KUBERNETES_SERVICE_NAME}:build-${CIRCLE_SHA1}"
~/.kube/kubectl set image deployment/${KUBERNETES_SERVICE_NAME} ${KUBERNETES_SERVICE_NAME}=${DOCKER_REGISTRY_URL}/${KUBERNETES_SERVICE_NAME}:build-${CIRCLE_SHA1}
echo "Finished Updating deployment image for frontend-test!!!"
