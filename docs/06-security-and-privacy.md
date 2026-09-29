# Security and privacy

**Last checked:** 2026-09-29

## What this app stores

| Data | Where it lives | Who can see it |
| --- | --- | --- |
| Brew notes (brew method), roast type, coffee-to-water ratio, coffee and water in grams, grind setting, brew time, temperature, and taste notes | on the device via `hive_ce` (browser IndexedDB on the web build) | only the user using the browser on that device |

There is nothing to be sent to a server. No account credentials, no logins, no device syncing, no nothing. Each instance of my app on a device keeps its data to itself.

## Secrets

- Values my app needs at run time: none. The app does not make any network calls and does not need API keys, backend URLs, or any kind of credentials.
- Where they live locally: not applicable because there is no `.env` file for there is no need for one.
- Where the deploy workflow gets them: not applicable because `deploy-web.yml` builds and deploys the Flutter web output only. There are no secrets to read.
- Anything my deployed web build carries that a visitor could read, and why that
  is acceptable: nothing. The compiled web build does not have any keys, tokens, nor credentials because there are none. There is no need for them.

## What protects the data on the service side

- Nothing leaves the device so things like Firestore and Supabase are not needed. No need for security rules for there is no service to write them for.

## Checklist

- [✓] `.env` (or `env.json`) is in `.gitignore`, and `.env.example` is committed
- [✓] `git log -p | grep -i "api_key\|secret\|password\|token"` finds nothing real
- [✓] No service account file, keystore or `service_role` key anywhere in the repo
- [✓] Security rules or RLS policies written and tested, not left open
- [✓] No real personal data in sample data, screenshots or the video
- [✓] No course or university credentials anywhere
- [✓] Anyone whose data appears in a test was asked first

There was nothing found or revoked. The checklist simply confirmed what was already true. This app has no backend, no secrets, no login credentials, no nothing at all to begin with. So nothing was really there to catch. This entire app was made with the idea of not being a part of someone's device's attack surface and with the KISS principle. This means data is simply stored locally with no extra fluff that can potentially be a part of the device's attack surface.
