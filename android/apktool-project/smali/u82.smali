.class public final Lu82;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:J

.field public final synthetic k:Lh92;


# direct methods
.method public constructor <init>(Lh92;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lu82;->j:J

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lu82;->k:Lh92;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lu82;->k:Lh92;

    .line 2
    .line 3
    invoke-virtual {v0}, Lgx1;->l()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lh92;->p()V

    .line 7
    .line 8
    .line 9
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Ly02;

    .line 12
    .line 13
    iget-object v2, v1, Ly02;->o:Lzy1;

    .line 14
    .line 15
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, v2, Lzy1;->w:Lso;

    .line 19
    .line 20
    const-string v3, "Activity paused, time"

    .line 21
    .line 22
    iget-wide v8, p0, Lu82;->j:J

    .line 23
    .line 24
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v2, p0, v3}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v5, v0, Lh92;->p:Lxn0;

    .line 32
    .line 33
    new-instance v4, Lx82;

    .line 34
    .line 35
    iget-object p0, v5, Lxn0;->l:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Lh92;

    .line 38
    .line 39
    iget-object v2, p0, Let;->j:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v2, Ly02;

    .line 42
    .line 43
    iget-object v2, v2, Ly02;->t:Lmz;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v6

    .line 52
    invoke-direct/range {v4 .. v9}, Lx82;-><init>(Lxn0;JJ)V

    .line 53
    .line 54
    .line 55
    iput-object v4, v5, Lxn0;->k:Ljava/lang/Object;

    .line 56
    .line 57
    iget-object p0, p0, Lh92;->l:Lum1;

    .line 58
    .line 59
    const-wide/16 v2, 0x7d0

    .line 60
    .line 61
    invoke-virtual {p0, v4, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 62
    .line 63
    .line 64
    iget-object p0, v1, Ly02;->m:Lmt1;

    .line 65
    .line 66
    invoke-virtual {p0}, Lmt1;->A()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_0

    .line 71
    .line 72
    iget-object p0, v0, Lh92;->o:Lf92;

    .line 73
    .line 74
    iget-object p0, p0, Lf92;->c:Lz82;

    .line 75
    .line 76
    invoke-virtual {p0}, Lfu1;->c()V

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method
