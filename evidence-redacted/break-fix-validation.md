# Break/Fix Validation Evidence

This document summarizes the controlled break/fix tests performed against the AI Security Cloud Baseline.

Sensitive values such as AWS account identifiers, access key IDs, secret keys, ARNs, bucket names, IAM usernames, and raw CloudTrail payloads were redacted before publishing.

---

## Test 1: Unexpected AssumeRole Attempt

### Objective
Validate that an unexpected identity could not assume the AI workload role.

### Expected Result
AccessDenied.

### Result
The AssumeRole attempt was denied. CloudTrail captured the AssumeRole activity.

### Control Validated
IAM trust policy and workload role separation.

### Production Risk Reduced
Prevents unauthorized identities from assuming the AI workload role and abusing permissions assigned to AI workloads.

---

## Test 2: Leaked-Key Simulation

### Objective
Simulate IAM access key creation and revocation visibility.

### Expected Result
CreateAccessKey and DeleteAccessKey events appear in CloudTrail.

### Result
Access key activity was captured in CloudTrail. The temporary/unused key was revoked and key status was verified.

### Control Validated
CloudTrail visibility for IAM credential lifecycle events.

### Production Risk Reduced
Improves response readiness for leaked AWS access keys by proving key creation and key deletion activity can be investigated.

### Safety Note
SecretAccessKey values were not published, committed, or retained.

---

## Test 3: PutObject Without Server-Side Encryption

### Objective
Validate that S3 blocks object uploads without required KMS server-side encryption.

### Expected Result
AccessDenied.

### Result
The unencrypted PutObject attempt failed with AccessDenied. CloudTrail data events captured the denied S3 PutObject attempt.

### Control Validated
S3 bucket policy requiring server-side encryption.

### Production Risk Reduced
Prevents sensitive AI workload data, RAG files, prompt logs, model outputs, or agent artifacts from being written without encryption.

---

## Test 4: Stop CloudTrail From Workload Role

### Objective
Validate that the AI workload role cannot stop CloudTrail logging.

### Expected Result
ExplicitDeny or AccessDenied.

### Result
IAM policy simulation showed cloudtrail:StopLogging was explicitly denied by the workload Permission Boundary. CloudTrail remained enabled after the test.

### Control Validated
IAM Permission Boundary.

### Production Risk Reduced
Prevents compromised AI workloads, agents, or MCP tools from disabling audit logging.

---

## Final Validation

A post-break/fix Terraform plan was executed to confirm the deployed infrastructure remained aligned with the Terraform configuration.

### Expected Result

```text
No changes. Infrastructure matches configuration.