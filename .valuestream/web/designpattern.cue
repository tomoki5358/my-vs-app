package web

DesignPattern: {
	name:        "myapp"
	description: "myapp"
	resources: {
		app: {
			resource0: {
				apiVersion: "v1"
				kind:       "Pod"
				metadata: {
					name: "two-containers"
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
					}]
				}
			}
		}
	}
}
