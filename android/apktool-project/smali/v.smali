.class public final Lv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Lc0;

.field public final k:Lqj0;


# direct methods
.method public constructor <init>(Lc0;Lqj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv;->j:Lc0;

    .line 5
    .line 6
    iput-object p2, p0, Lv;->k:Lqj0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lv;->j:Lc0;

    .line 2
    .line 3
    iget-object v0, v0, Lc0;->j:Ljava/lang/Object;

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lv;->k:Lqj0;

    .line 9
    .line 10
    invoke-static {v0}, Lc0;->h(Lqj0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lc0;->o:Lju1;

    .line 15
    .line 16
    iget-object v2, p0, Lv;->j:Lc0;

    .line 17
    .line 18
    invoke-virtual {v1, v2, p0, v0}, Lju1;->h(Lc0;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lv;->j:Lc0;

    .line 25
    .line 26
    invoke-static {p0}, Lc0;->e(Lc0;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method
