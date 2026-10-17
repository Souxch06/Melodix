.class Lcom/squareup/picasso/Dispatcher$1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/picasso/Dispatcher;->shutdown()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/picasso/Dispatcher;


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/Dispatcher;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/squareup/picasso/Dispatcher$1;->this$0:Lcom/squareup/picasso/Dispatcher;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/Dispatcher$1;->this$0:Lcom/squareup/picasso/Dispatcher;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/squareup/picasso/Dispatcher;->receiver:Lcom/squareup/picasso/Dispatcher$NetworkBroadcastReceiver;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/squareup/picasso/Dispatcher$NetworkBroadcastReceiver;->unregister()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
