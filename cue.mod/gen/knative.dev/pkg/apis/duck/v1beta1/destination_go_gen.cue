// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go knative.dev/pkg/apis/duck/v1beta1

package v1beta1

import (
	corev1 "k8s.io/api/core/v1"
	"knative.dev/pkg/apis"
)

// Destination represents a target of an invocation over HTTP.
#Destination: {
	// Ref points to an Addressable.
	// +optional
	ref?: null | corev1.#ObjectReference @go(Ref,*corev1.ObjectReference)

	// +optional
	apiVersion?: string @go(DeprecatedAPIVersion)

	// +optional
	kind?: string @go(DeprecatedKind)

	// +optional
	name?: string @go(DeprecatedName)

	// +optional
	namespace?: string @go(DeprecatedNamespace)

	// URI can be an absolute URL(non-empty scheme and non-empty host) pointing to the target or a relative URI. Relative URIs will be resolved using the base URI retrieved from Ref.
	// +optional
	uri?: null | apis.#URL @go(URI,*apis.URL)
}