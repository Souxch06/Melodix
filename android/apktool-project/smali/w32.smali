.class public final Lw32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lvv1;

.field public final synthetic k:Lc52;


# direct methods
.method public constructor <init>(Lc52;Lvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lw32;->j:Lvv1;

    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lw32;->k:Lc52;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lw32;->k:Lc52;

    .line 2
    .line 3
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ly02;

    .line 6
    .line 7
    iget-object v1, v1, Ly02;->q:Lh92;

    .line 8
    .line 9
    invoke-static {v1}, Ly02;->k(Lay1;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v1, Let;->j:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Ly02;

    .line 15
    .line 16
    iget-object v2, v1, Ly02;->n:Lvz1;

    .line 17
    .line 18
    iget-object v3, v1, Ly02;->n:Lvz1;

    .line 19
    .line 20
    invoke-static {v2}, Ly02;->j(Let;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Lvz1;->s()Lu22;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget-object v4, Lt22;->l:Lt22;

    .line 28
    .line 29
    invoke-virtual {v2, v4}, Lu22;->i(Lt22;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v4, 0x0

    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    iget-object v1, v1, Ly02;->o:Lzy1;

    .line 37
    .line 38
    invoke-static {v1}, Ly02;->l(Lm22;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, v1, Lzy1;->t:Lso;

    .line 42
    .line 43
    const-string v2, "Analytics storage consent denied; will not get session id"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lso;->b(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    :goto_0
    move-object v1, v4

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, v1, Ly02;->t:Lmz;

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    invoke-virtual {v3, v1, v2}, Lvz1;->u(J)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_0

    .line 67
    .line 68
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, v3, Lvz1;->z:Lrz1;

    .line 72
    .line 73
    invoke-virtual {v1}, Lrz1;->a()J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    const-wide/16 v5, 0x0

    .line 78
    .line 79
    cmp-long v1, v1, v5

    .line 80
    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-static {v3}, Ly02;->j(Let;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, v3, Lvz1;->z:Lrz1;

    .line 88
    .line 89
    invoke-virtual {v1}, Lrz1;->a()J

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    :goto_1
    iget-object p0, p0, Lw32;->j:Lvv1;

    .line 98
    .line 99
    if-eqz v1, :cond_3

    .line 100
    .line 101
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v0, Ly02;

    .line 104
    .line 105
    iget-object v0, v0, Ly02;->r:Lcb2;

    .line 106
    .line 107
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 111
    .line 112
    .line 113
    move-result-wide v1

    .line 114
    invoke-virtual {v0, p0, v1, v2}, Lcb2;->Z(Lvv1;J)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    :try_start_0
    invoke-interface {p0, v4}, Lvv1;->l(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :catch_0
    move-exception p0

    .line 123
    iget-object v0, v0, Let;->j:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast v0, Ly02;

    .line 126
    .line 127
    iget-object v0, v0, Ly02;->o:Lzy1;

    .line 128
    .line 129
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 133
    .line 134
    const-string v1, "getSessionId failed with exception"

    .line 135
    .line 136
    invoke-virtual {v0, p0, v1}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method
