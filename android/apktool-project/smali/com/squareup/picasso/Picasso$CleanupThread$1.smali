.class Lcom/squareup/picasso/Picasso$CleanupThread$1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/picasso/Picasso$CleanupThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/picasso/Picasso$CleanupThread;

.field final synthetic val$e:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/Picasso$CleanupThread;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/squareup/picasso/Picasso$CleanupThread$1;->this$0:Lcom/squareup/picasso/Picasso$CleanupThread;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/squareup/picasso/Picasso$CleanupThread$1;->val$e:Ljava/lang/Exception;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/squareup/picasso/Picasso$CleanupThread$1;->val$e:Ljava/lang/Exception;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method
