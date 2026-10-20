.class public final Lcom/melodix/music/NativeAssetRunner;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;


# instance fields
.field private final a:Lcom/melodix/music/MainActivity;

.field private final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/melodix/music/NativeAssetRunner;->a:Lcom/melodix/music/MainActivity;

    iput-object p2, p0, Lcom/melodix/music/NativeAssetRunner;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/NativeAssetRunner;->a:Lcom/melodix/music/MainActivity;

    if-eqz v0, :asset_runner_done

    iget-object v1, p0, Lcom/melodix/music/NativeAssetRunner;->b:Ljava/lang/String;

    if-eqz v1, :asset_runner_done

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :asset_runner_done

    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->runNativeJavascript(Ljava/lang/String;)V

    :asset_runner_done
    return-void
.end method
