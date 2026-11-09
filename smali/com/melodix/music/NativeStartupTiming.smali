.class public final Lcom/melodix/music/NativeStartupTiming;
.super Ljava/lang/Object;

# Measurement only, process-local, no disk/network/account access. Only the
# closed redacted grammar below can reach the clipboard's MDXPERF section.
.field private static journal:Ljava/lang/StringBuffer;
.field private static pattern:Ljava/util/regex/Pattern;
.field private static dropped:I
.field private static resumed:Z

.method static constructor <clinit>()V
    .locals 1
    new-instance v0, Ljava/lang/StringBuffer;
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V
    sput-object v0, Lcom/melodix/music/NativeStartupTiming;->journal:Ljava/lang/StringBuffer;
    const-string v0, "^sid=[0-9a-f]{8} t=[0-9]{1,16} (perf (activity-create|activity-resume|capture-end|content-view|webview-created|webview-load-start|page-loaded|css-ready|token-request|token-ready|library-request|library-response|home-payload|home-first-paint|home-first-image|home-cache-hit|home-cache-miss|native-payload|native-rows)(=[0-9]{1,6})?|js-shell-ready|bridge-js-started|bridge-bootstrap-ready|library-fetch phase=response http=401 mime=(json|html|other|missing) duration=[0-9]{1,6} error=http-401 auth=webview-session refresh=unsupported|library-fetch phase=response http=403 mime=(json|html|other|missing) duration=[0-9]{1,6} error=http-403 auth=webview-session refresh=unsupported|library-fetch phase=(request|response|parse|transform|settle) http=(0|[1-5][0-9]{2}) mime=(json|html|other|missing) duration=[0-9]{1,6} error=(none|empty|http-other|timeout|network|non-json|invalid-json|unexpected-shape|graphql|parse|transform) auth=webview-session refresh=unsupported|library\\.state state=(inactive|loading|ready|empty|retry-planned|unavailable)|library\\.request\\.started attempt=[0-9]{1,6} request=[0-9]{1,4} source=(shell-update|native-retry|web-home-retry|unspecified)|library\\.request\\.response attempt=[0-9]{1,6} request=[0-9]{1,4} http=(0|[1-5][0-9]{2}) mime=(json|html|other|missing) duration=[0-9]{1,6}|library\\.parse\\.completed attempt=[0-9]{1,6} request=[0-9]{1,4} result=(valid|empty|malformed|partial)|library\\.data\\.ready result=(empty|populated)|library\\.error category=(http-401|http-403|rate-limit|timeout|network|non-json|invalid-json|unexpected-shape|graphql|transform|http-other|other) http=(0|[1-5][0-9]{2})|home-data stage=web-to-android result=(sent|failed)|home-data stage=web-rendered|home-data stage=android-received result=received|home-data stage=android-render-start result=started|home-data stage=android-parsed result=(valid|empty|invalid)|home-data stage=android-model result=(cards|status|empty|invalid|unavailable)|home-data stage=android-rendered result=(rendered|status|failed)|home-data stage=android-visible result=(cards|status)|token-http endpoint=(api|fallback|cache) phase=(start|end|error) http=[0-9]{1,3} duration=[0-9]{1,6}|token-result status=(ok|none|ko-network|ko-http[1-5][0-9]{2}|unknown) duration=[0-9]{1,6}|proof-guard decision=(blocked|allowed|deferred) reason=(auth-required|in-flight|dom-unknown|dom-in-progress|dom-connected|dom-required)|session-verify result=(retry|player-navigation|failed|timeout)|navigation source=(start|finish|factory|ensure|button|recovery|bridge|request|redirect|history-reload|history-change) route=(accounts|player|login|local|other)|proof (set-bridge-login|clear-oncreate|clear-resume|clear-resume-2|clear-accounts|clear-left-player|clear-logout)=(T|F)|stage (shell-asset-loaded|bridge-asset-loaded|runtime-state-asset-loaded|css-asset-loaded|shell-injection-queued|bridge-loader-started|shell-js-started|shell-js-initialized|shell-js-failed|AndBridge-interface-attached|AndBridge-interface-detached|native-ui-ready-callback-returned)|proof-native decision=blocked reason=unproven site=(show-native|screen|route|rows)|shelf stage=layout cards=[0-9]{1,5} orientation=[01] width=[0-9]{1,6} height=[0-9]{1,6} overlaps=[0-9]{1,5} overflow=[0-9]{1,5}|image stage=limit|image result=(loaded|failed|limit)|image stage=start host=(other|([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)) key=[0-9a-f]{8} form=(https|empty|spotify|invalid) px=[0-9]{1,5}|image stage=source host=(other|([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)) key=[0-9a-f]{8} form=(https|empty|spotify|invalid)|image stage=request host=(other|([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)) key=[0-9a-f]{8}|image stage=http host=(other|([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)) key=[0-9a-f]{8} code=[1-5][0-9]{2} duration=[0-9]{1,6} bytes=(-1|[0-9]{1,12}) type=(jpeg|png|webp|avif|gif|other|unknown)|image stage=result host=(other|([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)) key=[0-9a-f]{8} result=(loaded|failed-network|failed-http|failed-io|failed-other|skipped) duration=[0-9]{1,6}|image stage=(decoded|view) host=(other|([a-z0-9-]{1,40}\\.){0,3}(scdn\\.co|spotifycdn\\.com)) key=[0-9a-f]{8} width=-?[0-9]{1,5} height=-?[0-9]{1,5}( shown=(true|false))?|image stage=payload [0-9]{1,5} https=[0-9]{1,5} missing=[0-9]{1,5} invalid=[0-9]{1,5})$"
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v0
    sput-object v0, Lcom/melodix/music/NativeStartupTiming;->pattern:Ljava/util/regex/Pattern;
    return-void
.end method

.method public static record(Ljava/lang/String;)V
    .locals 5
    const-class v0, Lcom/melodix/music/NativeStartupTiming;
    monitor-enter v0
    :record_try
    if-eqz p0, :record_done
    sget-object v1, Lcom/melodix/music/NativeStartupTiming;->pattern:Ljava/util/regex/Pattern;
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z
    move-result v1
    if-eqz v1, :record_done
    sget-object v4, Lcom/melodix/music/NativeStartupTiming;->journal:Ljava/lang/StringBuffer;
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I
    move-result v2
    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v3
    add-int/2addr v2, v3
    add-int/lit8 v2, v2, 0x1
    const v3, 0x10000
    if-gt v2, v3, :record_drop
    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    const-string v2, "\n"
    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    goto :record_done
    :record_drop
    sget v1, Lcom/melodix/music/NativeStartupTiming;->dropped:I
    add-int/lit8 v1, v1, 0x1
    sput v1, Lcom/melodix/music/NativeStartupTiming;->dropped:I
    :record_done
    :record_end
    .catchall {:record_try .. :record_end} :record_error
    monitor-exit v0
    return-void
    :record_error
    move-exception v1
    monitor-exit v0
    return-void
.end method

.method public static reset()V
    .locals 3
    const-class v0, Lcom/melodix/music/NativeStartupTiming;
    monitor-enter v0
    :reset_try
    sget-object v1, Lcom/melodix/music/NativeStartupTiming;->journal:Ljava/lang/StringBuffer;
    const/4 v2, 0x0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V
    sput v2, Lcom/melodix/music/NativeStartupTiming;->dropped:I
    sput-boolean v2, Lcom/melodix/music/NativeStartupTiming;->resumed:Z
    sput v2, Lcom/melodix/music/NativeSessionTrace;->imageCount:I
    sput-boolean v2, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->reported:Z
    :reset_end
    .catchall {:reset_try .. :reset_end} :reset_error
    monitor-exit v0
    return-void
    :reset_error
    move-exception v1
    monitor-exit v0
    return-void
.end method

.method public static resume()V
    .locals 1
    invoke-static {}, Lcom/melodix/music/NativeImageTrace;->resetBudget()V
    sget-boolean v0, Lcom/melodix/music/NativeStartupTiming;->resumed:Z
    if-eqz v0, :resume_first
    # Keep the pre-SSO proof/navigation history for one diagnostic copy.
    const/4 v0, 0x0
    sput v0, Lcom/melodix/music/NativeSessionTrace;->imageCount:I
    sput-boolean v0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->reported:Z
    const-string v0, "activity-resume"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->perfMark(Ljava/lang/String;)V
    :resume_first
    const/4 v0, 0x1
    sput-boolean v0, Lcom/melodix/music/NativeStartupTiming;->resumed:Z
    return-void
.end method

.method public static appendTo(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    const-string v0, "capture-end"
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->perfMark(Ljava/lang/String;)V
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "\nMDXPERF-BEGIN v=1 dropped="
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget v1, Lcom/melodix/music/NativeStartupTiming;->dropped:I
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "\n"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    sget-object v3, Lcom/melodix/music/NativeStartupTiming;->journal:Ljava/lang/StringBuffer;
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "MDXPERF-END"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method
