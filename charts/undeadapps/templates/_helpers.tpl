{{/*
Expand the name of the chart.
*/}}
{{- define "undeadapps.name" -}}
{{- printf "%s" .Values.name -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "undeadapps.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "undeadapps.labels" -}}
helm.sh/chart: {{ include "undeadapps.chart" . }}
{{ include "undeadapps.selectorLabels" . }}
{{- if .Values.image.tag }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "undeadapps.selectorLabels" -}}
app.kubernetes.io/name: {{ include "undeadapps.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "undeadapps.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "undeadapps.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
