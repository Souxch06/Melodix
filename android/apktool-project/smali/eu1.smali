.class public final Leu1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lo22;

.field public final synthetic k:Lfu1;


# direct methods
.method public constructor <init>(Lfu1;Lo22;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Leu1;->j:Lo22;

    .line 5
    .line 6
    iput-object p1, p0, Leu1;->k:Lfu1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Leu1;->j:Lo22;

    .line 2
    .line 3
    invoke-interface {v0}, Lo22;->a()Ltb0;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ltb0;->m()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v0}, Lo22;->c()Ls02;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Ls02;->u(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Leu1;->k:Lfu1;

    .line 21
    .line 22
    iget-wide v0, p0, Lfu1;->c:J

    .line 23
    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    :goto_0
    iput-wide v2, p0, Lfu1;->c:J

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lfu1;->a()V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method
