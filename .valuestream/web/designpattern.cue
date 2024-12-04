package web

import (

	"qmonus.net/adapter/official/types:base"
)


DesignPattern: {
	name:        "myapp"
	description: "myapp"
	parameters: {
		dbpass: base.#Secret
}
	resources: {
		app: {
            resource1: {
				                                apiVersion: "external-secrets.io/v1beta1"
                                kind:       "ExternalSecret"
                                metadata: {
                                        name:      "ogawa-secret"
                                        namespace: "qmonus-system"
                                }
                                spec: {
                                        data: [{
                                                remoteRef: {
                                                        conversionStrategy: "Default"
                                                        decodingStrategy:   "None"
                                                        key:                parameters.dbpass.key
                                                        version:            "1"
                                                }
                                                secretKey: "DB_PASS"
                                        }]
                                        refreshInterval: "0"
                                        secretStoreRef: {
                                                kind: "SecretStore"
                                                name: "gcp-secret-manager-ss"
                                        }
                                        target: {
                                                creationPolicy: "Owner"
                                                deletionPolicy: "Retain"
                                                name:           "ogawa-secret"
                                        }
                                }
                        }			
			resource0: {
				apiVersion: "v1"
				kind:       "Pod"
				metadata: {
					name: "two-containers"
					namespace: "qmonus-system"
				}
				spec: {
					restartPolicy: "Never"
					volumes: [{
						name: "shared-data"
						emptyDir: {}
					}]
					containers: [{
						name:  "nginx-container"
						image: "nginx"
						volumeMounts: [{
							name:      "shared-data"
							mountPath: "/usr/share/nginx/html"
						}]
					}, {
						name:  "debian-container"
						image: "debian"
						volumeMounts: [{
							name:      "shared-data"
							mountPath: "/pod-data"
						}]
						command: ["/bin/sh"]
						args: ["-c", "echo Hello from the debian container > /pod-data/index.html"]
					}]
				}
			}
		}
	}
}

