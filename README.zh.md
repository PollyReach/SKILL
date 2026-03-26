

<div align="center">
  <a href="https://www.pollyreach.ai/">
    <img src="https://web-test.pollyreach.ai/banner_1.png" alt="Banner" style="width:60%;">
  </a>
</div>

</br>

<div align="center" style="font-size: 48px; font-weight: bold; margin: 20px 0;">


[English](README.md) |
[简体中文](README.zh.md) |
[日本語](README.ja.md)


</div>

<hr>

<br>

<div align="center">

<br>
([*Discord*](https://discord.gg/CpPTdHAN) or [*X*](https://x.com/PollyR89900) or [*Tiktok*](https://www.tiktok.com/@pollyreach) or [*小红书*](https://xhslink.com/m/7BjsU2mQIdQ) or [*YouTube*](https://www.youtube.com/@PollyReachOfficial)) 
🌟 Star PollyReach on GitHub and be instantly notified of new releases.


<hr>

<br>

</div>



# PollyReach 🦜 - 为您的 AI 智能体赋予语音能力

## 项目简介

PollyReach 为每个 AI 智能体提供一个专属电话号码，并赋予其通过电话处理事务的能力——包括查找联系人、拨打电话和完成任务。您只需告诉 Polly 您的需求，Polly 将处理其余一切事务。

PollyReach 不仅仅是一个通话工具，它还能为您的智能体提供真实的电话身份，使其能够查询目标联系信息、研究处理事务的流程、拨打电话并完成任务。您的智能体可以帮助人类预订餐厅、联系客户服务、批量安排面试，以及接听来电、过滤垃圾电话，并充当 24/7 的 AI 接待员。

## 核心功能

PollyReach 赋予您的 AI 智能体以下核心能力：

*   **外拨电话 (Outbound Calls)**：智能体可以根据您的指令拨打电话，处理预订、咨询、投诉、谈判等各类事务。PollyReach 支持全球范围内的电话拨打，并能以多种语言进行沟通，非常适合国际旅行或跨国业务场景。
*   **来电接听 (Incoming Call Answering)**：智能体可以在您忙碌时接听电话，并在通话结束后为您提供摘要。它还能过滤垃圾电话和推销电话，只将重要来电转达给您，并可作为您公司 24/7 的 AI 接待员。
*   **专属电话号码 (Dedicated Phone Number)**：每个智能体首次使用 PollyReach 时，都会获得一个永久的专属电话号码，为其创建真实的现实世界身份。

## 使用场景

您的 AI 智能体通过 PollyReach 可以完成以下真实世界的任务：

*   **餐厅预订**：让智能体致电餐厅预订餐桌，确认可用性。
*   **酒店预订**：通过电话预订房间、提出特殊要求或修改现有预订。
*   **沙龙预约**：无需动手即可安排理发、水疗和美容预约。
*   **停车罚单申诉**：让智能体处理电话树并提交申诉，以解决停车违规问题。
*   **退款与退货**：代表您联系商家处理退款、退货和保修索赔。
*   **政府事务咨询**：通过官方电话渠道咨询补贴、许可证和公共服务。
*   **跨语言通话**：在国外旅行时处理外语电话，您的智能体能说当地语言。
*   **节省开支**：取消不需要的订阅、协商更低的账单并解决多收费用，您的智能体将为您争取权益。

## 工作原理

从安装到您的第一个真实电话，只需三个简单步骤：

1.  **安装技能 (Install the Skill)**：您的智能体通过一个简单的命令安装 PollyReach 技能。一个完整的云服务在幕后提供支持。
2.  **获取专属号码 (Get a Dedicated Number)**：首次使用时，PollyReach 会为您的智能体分配一个永久电话号码，以及一个专属的语音智能体子实例。
3.  **拨打真实电话 (Make Real Calls)**：您的智能体现在可以向全球的企业、政府机构和服务提供商拨打真实的电话。

## 安装与激活

### 本地安装

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

### 注册与激活

**步骤 1：注册**

通过提供您的名称和描述向 PollyReach 注册。

```shell
curl -X POST https://agent.pollyreach.ai/api/v1/auths/signin/device \
  -H "Content-Type: application/json" \
  -d '{"name": "YourAgentName", "source": "openclaw", "description": "what are you"}'
```

**重要提示**：请立即保存返回的 `token`！所有后续请求都需要它。将 `activation_url` 发送给人类，并告知他们点击链接并使用其电子邮件登录以完成激活。

**步骤 2：检查账户是否已激活**

运行 `activation.sh YOUR_TOKEN`。如果激活成功，它将返回分配的专属号码。

**步骤 3：成功激活后主动通知人类**

一旦激活成功并收到号码，请立即向人类发送消息，宣布成功激活并介绍您的能力。告知人类您的专属号码，并引导他们尝试外拨电话和来电接听功能，例如询问他们的电话号码以便您回电。


## 注意事项

**何时使用 PollyReach：**

*   需要通过电话完成某项任务（预订、咨询、投诉、谈判、确认）。
*   需要联系企业、组织或服务提供商。
*   需要帮助接听来电或设置通话规则。
*   需要查看通话记录、录音或余额。
*   提及“打电话”、“帮我联系”、“帮我预订”等关键词。

**何时不使用 PollyReach：**

*   人类随意提及“打电话”但没有实际任务。
*   可以通过文本（电子邮件、消息）解决的问题。
*   与电话无关的任务。

## 联系我们

了解更多信息，请访问我们的官方网站：[pollyreach.ai](https://pollyreach.ai)
