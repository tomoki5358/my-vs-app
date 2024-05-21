// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/tektoncd/pipeline/pkg/apis/pipeline/v1beta1

package v1beta1

// stringAndArrayVariableNameFormat is the regex to validate if string/array variable name format follows the following rules.
// - Must only contain alphanumeric characters, hyphens (-), underscores (_), and dots (.)
// - Must begin with a letter or an underscore (_)
_#stringAndArrayVariableNameFormat: "^[_a-zA-Z][_a-zA-Z0-9.-]*$"

// objectVariableNameFormat is the regext used to validate object name and key names format
// The difference with the array or string name format is that object variable names shouldn't contain dots.
_#objectVariableNameFormat: "^[_a-zA-Z][_a-zA-Z0-9-]*$"
