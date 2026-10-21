.class final Lcom/melodix/music/NativeRecheckClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;


.field private final activity:Lcom/melodix/music/MainActivity;


.method public constructor <init>(Lcom/melodix/music/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/NativeRecheckClickListener;->activity:Lcom/melodix/music/MainActivity;

    return-void
.end method


# Asks the page to collect again and to resend what it sees. The shell exposes
# __sfNativeUiRecheck, which drops its cached signature first.
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/NativeRecheckClickListener;->activity:Lcom/melodix/music/MainActivity;

    if-eqz v0, :done

    const-string v1, "window.__sfNativeUiRecheck&&window.__sfNativeUiRecheck()"

    :try_start_0
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v1

    :done
    return-void
.end method
