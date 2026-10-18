.class Lcom/squareup/picasso/Utils$PicassoThreadFactory;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/picasso/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PicassoThreadFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 0

    .line 1
    new-instance p0, Lcom/squareup/picasso/Utils$PicassoThread;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/squareup/picasso/Utils$PicassoThread;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
