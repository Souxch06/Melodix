.class public final Lcom/melodix/music/NativeSessionAttemptDiagnostic;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
# Observation-only. Never used by the classifier, proof guard, or requests.
.field private final payload:Ljava/lang/String;
.field private static rows:Ljava/util/LinkedHashMap;
.field private static aliases:Ljava/util/HashMap;
.method static constructor <clinit>()V
    .locals 1
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->rows:Ljava/util/LinkedHashMap;
    new-instance v0, Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->aliases:Ljava/util/HashMap;
    return-void
.end method
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->payload:Ljava/lang/String;
    return-void
.end method
.method public final run()V
    .locals 2
    :try_start
    iget-object v0, p0, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->payload:Ljava/lang/String;
    invoke-static {v0}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->record(Ljava/lang/String;)V
    # Refresh details only: never paint/navigate/reclassify from diagnostic events.
    sget-object v0, Lcom/melodix/music/NativeSessionGate;->overlay:Landroid/view/View;
    if-eqz v0, :done
    const-string v1, "sessionDetails"
    invoke-static {v0, v1}, Lcom/melodix/music/NativeSessionSurface;->text(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v0
    if-eqz v0, :done
    invoke-static {}, Lcom/melodix/music/NativeSessionGate;->details()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    :done
    return-void
    :error
    move-exception v0
    return-void
.end method
.method public static reset()V
    .locals 1
    sget-object v0, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->rows:Ljava/util/LinkedHashMap;
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V
    sget-object v0, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->aliases:Ljava/util/HashMap;
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V
    return-void
.end method
.method private static status(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v0
    const/16 v1, 0x64
    if-lt v0, v1, :unknown
    const/16 v1, 0x257
    if-gt v0, v1, :unknown
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v0
    return-object v0
    :unknown
    const-string v0, "inconnu"
    return-object v0
.end method
.method private static alias()Ljava/lang/String;
    .locals 4
    invoke-static {}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->current()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :unknown
    sget-object v1, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->aliases:Ljava/util/HashMap;
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    if-nez v2, :found
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I
    move-result v2
    const/16 v3, 0x10
    if-ge v2, v3, :unknown
    add-int/lit8 v2, v2, 0x1
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "c"
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I
    move-result v2
    add-int/lit8 v2, v2, 0x1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :found
    return-object v2
    :unknown
    const-string v2, "inconnu"
    return-object v2
.end method
.method private static current()Ljava/lang/String;
    .locals 4
    :try_start
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    move-result-object v0
    const-string v1, "https://open.spotify.com/"
    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :none
    const-string v1, "(?:^|;[ ]*)sp_dc=([^;]+)"
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z
    move-result v2
    if-eqz v2, :none
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    const-string v1, "SHA-256"
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->digest([B)[B
    move-result-object v0
    const/4 v1, 0x2
    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    move-result-object v0
    return-object v0
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    :error
    move-exception v0
    :none
    const/4 v0, 0x0
    return-object v0
.end method
.method private static mergeHttp(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    invoke-static {p0, p2}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->status(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "inconnu"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done
    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :done
    return-void
.end method
.method public static record(Ljava/lang/String;)V
    .locals 8
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    const-string v1, "generation"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v2
    if-ltz v2, :done
    const-string v1, "attempt"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v3
    if-ltz v3, :done
    const v1, 0xf423f
    if-gt v3, v1, :done
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "/"
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->rows:Ljava/util/LinkedHashMap;
    invoke-virtual {v5, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lorg/json/JSONObject;
    if-nez v6, :existing
    new-instance v6, Lorg/json/JSONObject;
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V
    const-string v1, "alias"
    const-string v7, "inconnu"
    if-eqz v3, :alias_ready
    const-string v7, "completed"
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :observe_alias
    const-string v7, "inconnu"
    goto :alias_ready
    :observe_alias
    invoke-static {}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->alias()Ljava/lang/String;
    move-result-object v7
    :alias_ready
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :existing
    # Preserve every valid HTTP observation across partial/reason-only messages.
    const-string v1, "apiHttp"
    invoke-static {v0, v6, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->mergeHttp(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    const-string v1, "fallbackHttp"
    invoke-static {v0, v6, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->mergeHttp(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    const-string v1, "libraryHttp"
    invoke-static {v0, v6, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->mergeHttp(Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;)V
    const-string v1, "completed"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :no_completion
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v7
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v2
    or-int/2addr v7, v2
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :no_completion
    const-string v1, "source"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    const-string v2, "shell-update|native-retry|web-home-retry|unspecified"
    invoke-virtual {v7, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :no_source
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :no_source
    const-string v1, "tokenResult"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    const-string v2, "obtained|refused|not-attempted"
    invoke-virtual {v7, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :no_token
    # A late start snapshot must not overwrite an observed token result.
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const-string p0, "obtained|refused"
    invoke-virtual {v2, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :no_token
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :no_token
    const-string v1, "reason"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    const-string v2, "rejet=(generation-perimee|tentative-deja-traitee-ou-ancienne)|abandon=(requete-perimee|contexte-auth-perime)|blocage=(dom-auth-required|attente-429|fonction-js-indisponible)|token-source=cache"
    invoke-virtual {v7, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :no_reason
    const-string v1, "reasons"
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v2, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result p0
    if-nez p0, :no_reason
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, " · "
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :no_reason
    invoke-virtual {v5, v4, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    # If a real attempt started, mark the matching relance without inventing completion.
    if-eqz v3, :trim
    const-string v1, "completed"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :trim
    const-string v1, "generation"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v2
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    move-result-object v2
    const-string v1, "/0"
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v5, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lorg/json/JSONObject;
    if-eqz v2, :trim
    const-string v1, "started"
    const/4 v7, 0x1
    invoke-virtual {v2, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :trim
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->size()I
    move-result v1
    const/16 v2, 0x10
    if-le v1, v2, :done
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :done
    return-void
.end method
.method public static reason(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3
    :try_start
    const-string v0, "generation"
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v1
    const-string v0, "attempt"
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I
    move-result v2
    invoke-static {v1, v2, p1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->note(IILjava/lang/String;)V
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    return-void
    :error
    move-exception v0
    return-void
.end method
.method public static note(IILjava/lang/String;)V
    .locals 3
    :try_start
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    const-string v1, "generation"
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    const-string v1, "attempt"
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    const-string v1, "reason"
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    move-result-object v0
    new-instance v1, Lcom/melodix/music/NativeSessionAttemptDiagnostic;
    invoke-direct {v1, v0}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->run()V
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :error
    return-void
    :error
    move-exception v0
    return-void
.end method
.method private static render(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 4
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "/0"
    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :attempt
    const-string v1, "\nRelance "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "started"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :not_started
    const-string v1, " · relance demandée, tentative réseau démarrée"
    goto :request_label
    :not_started
    const-string v1, "reasons"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, "blocage="
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-eqz v1, :unobserved
    const-string v1, " · relance demandée, aucune tentative réseau démarrée"
    goto :request_label
    :unobserved
    const-string v1, " · relance demandée, démarrage réseau=inconnu"
    :request_label
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :reasons
    :attempt
    const-string v1, "\nTentative "
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · token API="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "apiHttp"
    invoke-static {p1, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->status(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · repli="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "fallbackHttp"
    invoke-static {p1, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->status(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · bibliothèque="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "libraryHttp"
    invoke-static {p1, v1}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->status(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · terminée="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "completed"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v2
    const-string v3, "inconnu"
    if-eqz v2, :completion
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
    move-result v2
    const-string v3, "non"
    if-eqz v2, :completion
    const-string v3, "oui"
    :completion
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · cookie="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "alias"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · source="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "source"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :source_known
    const-string v1, "inconnu"
    :source_known
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " · token="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "tokenResult"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, "obtained"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :obtained
    const-string v2, "refused"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :refused
    const-string v2, "not-attempted"
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :not_attempted
    const-string v1, "inconnu"
    goto :token_label
    :obtained
    const-string v1, "obtenu"
    goto :token_label
    :refused
    const-string v1, "refusé"
    goto :token_label
    :not_attempted
    const-string v1, "non tenté"
    :token_label
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :reasons
    const-string v1, "reasons"
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method
.method public static appendTo(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget-object v1, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->rows:Ljava/util/LinkedHashMap;
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;
    move-result-object v1
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :loop
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :done
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lorg/json/JSONObject;
    invoke-static {v3, v2}, Lcom/melodix/music/NativeSessionAttemptDiagnostic;->render(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    goto :loop
    :done
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method
