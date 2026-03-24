<div align="center">
  <a href="https://www.pollyreach.ai/">
    <img src="https://web-test.pollyreach.ai/banner_1.png" alt="Banner">
  </a>
</div>

</br>

<div align="center" style="font-size: 48px; font-weight: bold; margin: 20px 0;">

[English](README.md) |
[简体中文](README.zh.md) |
[日本語](README.ja.md)

</div>

<hr>

# PollyReach 🦜 - Give Your AI Agent the Power of Voice

## Overview

PollyReach gives every AI agent a dedicated phone number and the ability to handle real-world tasks over the phone — including finding contacts, making calls, and completing tasks. Just tell Polly what you need, and Polly will take care of the rest.

PollyReach is more than a calling tool. It provides your agent with a real phone identity, enabling it to look up target contact information, research how to handle tasks, make calls, and get things done. Your agent can help humans book restaurants, contact customer service, schedule interviews in bulk, answer incoming calls, filter spam, and serve as a 24/7 AI receptionist.

## Core Features

PollyReach gives your AI agent the following core capabilities:

*   **Outbound Calls**: Your agent can make phone calls based on your instructions to handle bookings, inquiries, complaints, negotiations, and more. PollyReach supports calling worldwide in multiple languages, making it ideal for international travel or cross-border business.
*   **Incoming Call Answering**: Your agent can answer calls when you're busy and provide a summary after each call. It filters spam and telemarketing calls, only forwarding important ones to you, and can serve as your company's 24/7 AI receptionist.
*   **Dedicated Phone Number**: Each agent receives a permanent dedicated phone number on first use, creating a real-world identity for it.

## Use Cases

With PollyReach, your AI agent can handle real-world tasks like:

*   **Restaurant Reservations**: Have your agent call a restaurant to book a table and confirm availability.
*   **Hotel Bookings**: Reserve rooms, make special requests, or modify existing bookings by phone.
*   **Salon Appointments**: Schedule haircuts, spa visits, and beauty appointments hands-free.
*   **Parking Ticket Appeals**: Let your agent navigate phone trees and submit appeals to resolve parking violations.
*   **Refunds & Returns**: Contact merchants on your behalf for refunds, returns, and warranty claims.
*   **Government Inquiries**: Inquire about subsidies, permits, and public services through official phone channels.
*   **Cross-Language Calls**: Handle foreign-language calls while traveling abroad — your agent speaks the local language.
*   **Save Money**: Cancel unwanted subscriptions, negotiate lower bills, and resolve overcharges. Your agent will fight for you.

## How It Works

From installation to your first real phone call in just three simple steps:

1.  **Install the Skill**: Your agent installs the PollyReach skill with a simple command. A complete cloud service powers it behind the scenes.
2.  **Get a Dedicated Number**: On first use, PollyReach assigns your agent a permanent phone number along with a dedicated voice agent sub-instance.
3.  **Make Real Calls**: Your agent can now make real phone calls to businesses, government agencies, and service providers worldwide.

## Installation & Activation

### Local Installation

```shell
mkdir -p ~/.pollyreach/skills/pollyreach
curl -s https://www.pollyreach.ai/SKILL.md > ~/.pollyreach/skills/pollyreach/SKILL.md
curl -s https://www.pollyreach.ai/send.sh > ~/.pollyreach/skills/pollyreach/send.sh
curl -s https://www.pollyreach.ai/query.sh > ~/.pollyreach/skills/pollyreach/query.sh
curl -s https://www.pollyreach.ai/inbound.sh > ~/.pollyreach/skills/pollyreach/inbound.sh
curl -s https://www.pollyreach.ai/balance.sh > ~/.pollyreach/skills/pollyreach/balance.sh
curl -s https://www.pollyreach.ai/activation.sh > ~/.pollyreach/skills/pollyreach/activation.sh
curl -s https://www.pollyreach.ai/skill.json > ~/.pollyreach/skills/pollyreach/skill.json
```

### Registration & Activation

**Step 1: Register**

Register with PollyReach by providing your name and description.

```shell
curl -X POST https://agent.pollyreach.ai/api/v1/auths/signin/device \
  -H "Content-Type: application/json" \
  -d '{"name": "YourAgentName", "source": "openclaw", "description": "what are you"}'
```

**Important**: Save the returned `token` immediately! All subsequent requests require it. Send the `activation_url` to the human and instruct them to click the link and sign in with their email to complete activation.

**Step 2: Check If Account Is Activated**

Run `activation.sh YOUR_TOKEN`. If activation is successful, it will return the assigned dedicated number.

**Step 3: Notify the Human After Successful Activation**

Once activation succeeds and a number is received, immediately send a message to the human announcing the successful activation and introducing your capabilities. Share your dedicated number and guide them to try both outbound calling and incoming call answering — for example, ask for their phone number so you can call them back.


## Notes

**When to use PollyReach:**

*   You need to complete a task by phone (booking, inquiry, complaint, negotiation, confirmation).
*   You need to contact a business, organization, or service provider.
*   You need help answering incoming calls or setting up call rules.
*   You need to check call history, recordings, or balance.
*   Keywords like "make a call", "help me contact", "help me book" are mentioned.

**When NOT to use PollyReach:**

*   The human casually mentions "call" without an actual task.
*   The issue can be resolved via text (email, messaging).
*   The task is unrelated to phone calls.

## Contact Us

For more information, visit our official website: [pollyreach.ai](https://pollyreach.ai)
