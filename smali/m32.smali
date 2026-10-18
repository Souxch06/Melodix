.class public final Lm32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:J

.field public final synthetic k:Lc52;


# direct methods
.method public constructor <init>(Lc52;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lm32;->j:J

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lm32;->k:Lc52;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lm32;->k:Lc52;

    .line 2
    .line 3
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ly02;

    .line 6
    .line 7
    iget-object v1, v0, Ly02;->n:Lvz1;

    .line 8
    .line 9
    invoke-static {v1}, Ly02;->j(Let;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v1, Lvz1;->t:Lrz1;

    .line 13
    .line 14
    iget-wide v2, p0, Lm32;->j:J

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Lrz1;->b(J)V

    .line 17
    .line 18
    .line 19
    iget-object p0, v0, Ly02;->o:Lzy1;

    .line 20
    .line 21
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lzy1;->v:Lso;

    .line 25
    .line 26
    const-string v0, "Session timeout duration set"

    .line 27
    .line 28
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p0, v1, v0}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
