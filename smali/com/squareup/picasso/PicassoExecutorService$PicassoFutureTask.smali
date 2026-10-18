.class final Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/picasso/PicassoExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PicassoFutureTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask<",
        "Lcom/squareup/picasso/BitmapHunter;",
        ">;",
        "Ljava/lang/Comparable<",
        "Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;",
        ">;"
    }
.end annotation


# instance fields
.field private final hunter:Lcom/squareup/picasso/BitmapHunter;


# direct methods
.method public constructor <init>(Lcom/squareup/picasso/BitmapHunter;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lcom/squareup/picasso/BitmapHunter;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lcom/squareup/picasso/BitmapHunter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/squareup/picasso/BitmapHunter;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lcom/squareup/picasso/BitmapHunter;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/squareup/picasso/BitmapHunter;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lcom/squareup/picasso/BitmapHunter;

    .line 16
    .line 17
    iget p0, p0, Lcom/squareup/picasso/BitmapHunter;->sequence:I

    .line 18
    .line 19
    iget-object p1, p1, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lcom/squareup/picasso/BitmapHunter;

    .line 20
    .line 21
    iget p1, p1, Lcom/squareup/picasso/BitmapHunter;->sequence:I

    .line 22
    .line 23
    :goto_0
    sub-int/2addr p0, p1

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 34
    check-cast p1, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;

    invoke-virtual {p0, p1}, Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;->compareTo(Lcom/squareup/picasso/PicassoExecutorService$PicassoFutureTask;)I

    move-result p0

    return p0
.end method
