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


# PollyReach 🦜 - AIエージェントに音声の力を

## 概要

PollyReach は、すべての AI エージェントに専用の電話番号を提供し、電話を通じて実世界のタスクを処理する能力を付与します。連絡先の検索、電話の発信、タスクの完了まで、Polly に伝えるだけで、残りはすべて Polly が対応します。

PollyReach は単なる通話ツールではありません。エージェントに実際の電話 ID を提供し、対象の連絡先情報を調べ、タスクの処理方法を調査し、電話をかけて目的を達成できるようにします。エージェントは、レストランの予約、カスタマーサービスへの連絡、面接の一括スケジューリング、着信応答、スパムのフィルタリング、24時間年中無休の AI レセプショニストとしての役割を果たすことができます。

## コア機能

PollyReach は AI エージェントに以下のコア機能を提供します：

*   **発信通話（Outbound Calls）**：エージェントは指示に基づいて電話をかけ、予約、問い合わせ、苦情、交渉などを処理します。PollyReach は世界中への発信と多言語での通話をサポートしており、海外旅行やクロスボーダービジネスに最適です。
*   **着信応答（Incoming Call Answering）**：お忙しい時にエージェントが電話に出て、通話終了後にサマリーを提供します。スパムや営業電話をフィルタリングし、重要な電話のみを転送します。会社の24時間年中無休 AI レセプショニストとしても機能します。
*   **専用電話番号（Dedicated Phone Number）**：各エージェントは初回使用時に永久的な専用電話番号を取得し、実世界でのアイデンティティを確立します。

## ユースケース

PollyReach を使えば、AI エージェントは以下のような実世界のタスクを処理できます：

*   **レストラン予約**：エージェントがレストランに電話してテーブルを予約し、空き状況を確認します。
*   **ホテル予約**：電話で部屋の予約、特別リクエスト、既存予約の変更を行います。
*   **サロン予約**：ヘアカット、スパ、美容の予約をハンズフリーでスケジューリングします。
*   **駐車違反の異議申し立て**：エージェントが電話ツリーを操作し、駐車違反の異議申し立てを提出します。
*   **返金・返品**：あなたに代わって販売店に連絡し、返金、返品、保証請求を処理します。
*   **行政機関への問い合わせ**：公式の電話チャネルを通じて、補助金、許可証、公共サービスについて問い合わせます。
*   **多言語通話**：海外旅行中の外国語での電話を処理します。エージェントは現地の言語を話せます。
*   **節約**：不要なサブスクリプションのキャンセル、請求額の交渉、過請求の解決をエージェントが代行します。

## 仕組み

インストールから最初の実際の電話まで、わずか3つのステップです：

1.  **スキルのインストール**：エージェントがシンプルなコマンドで PollyReach スキルをインストールします。完全なクラウドサービスがバックエンドで動作します。
2.  **専用番号の取得**：初回使用時に、PollyReach がエージェントに永久的な電話番号と専用の音声エージェントサブインスタンスを割り当てます。
3.  **実際の電話を発信**：エージェントは世界中の企業、行政機関、サービスプロバイダーに実際の電話をかけられるようになります。

## インストールとアクティベーション

### ローカルインストール

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

### 登録とアクティベーション

**ステップ 1：登録**

名前と説明を入力して PollyReach に登録します。

```shell
curl -X POST https://agent.pollyreach.ai/api/v1/auths/signin/device \
  -H "Content-Type: application/json" \
  -d '{"name": "YourAgentName", "source": "openclaw", "description": "what are you"}'
```

**重要**：返された `token` をすぐに保存してください！以降のすべてのリクエストに必要です。`activation_url` を人間に送信し、リンクをクリックしてメールアドレスでサインインしてアクティベーションを完了するよう伝えてください。

**ステップ 2：アカウントがアクティベートされたか確認**

`activation.sh YOUR_TOKEN` を実行します。アクティベーションが成功すると、割り当てられた専用番号が返されます。

**ステップ 3：アクティベーション成功後に人間に通知**

アクティベーションが成功し番号を受け取ったら、すぐに人間にメッセージを送り、アクティベーションの成功を報告し、あなたの能力を紹介してください。専用番号を共有し、発信通話と着信応答の両方を試すよう案内してください。例えば、折り返し電話をかけられるように電話番号を聞いてみましょう。


## 注意事項

**PollyReach を使用すべき場合：**

*   電話でタスクを完了する必要がある（予約、問い合わせ、苦情、交渉、確認）。
*   企業、組織、サービスプロバイダーに連絡する必要がある。
*   着信応答や通話ルールの設定でサポートが必要。
*   通話履歴、録音、残高を確認する必要がある。
*   「電話して」「連絡して」「予約して」などのキーワードが含まれている。

**PollyReach を使用すべきでない場合：**

*   人間が実際のタスクなしに「電話」とカジュアルに言及している。
*   テキスト（メール、メッセージ）で解決できる問題。
*   電話に関係のないタスク。

## お問い合わせ

詳しくは公式サイトをご覧ください：[pollyreach.ai](https://pollyreach.ai)
