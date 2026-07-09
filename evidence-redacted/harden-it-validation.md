# Harden It Validation

This document summarizes the hardening controls added after the Chapter 5 break/fix validation.

Sensitive values such as AWS account identifiers, ARNs, detector IDs, bucket names, and raw service payloads were redacted before publishing.

---

## Objective

Tune the baseline controls based on what the break/fix tests revealed.

The hardening layer adds continuous monitoring and detection coverage for cloud security drift and suspicious AWS activity.

---

## Controls Added

| Control | Purpose | Status |
|---|---|---|
| AWS Config S3 Encryption Rule | Detects S3 buckets without server-side encryption | Active |
| AWS Config S3 Public Read Rule | Detects S3 buckets that allow public read access | Active |
| GuardDuty Detector | Enables AWS threat detection for suspicious account activity | Enabled |
| GuardDuty to SNS Event Rule | Routes GuardDuty findings into the alert channel | Enabled |

---

## Validation Results

### AWS Config Rules

Two AWS managed Config rules were deployed and verified:

```text
s3-bucket-server-side-encryption-enabled
s3-bucket-public-read-prohibited