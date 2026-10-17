.class public final Lb62;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lbc2;

.field public final synthetic m:Z

.field public final synthetic n:Lvv1;

.field public final synthetic o:Li82;


# direct methods
.method public constructor <init>(Li82;Ljava/lang/String;Ljava/lang/String;Lbc2;ZLvv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lb62;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Lb62;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Lb62;->l:Lbc2;

    .line 9
    .line 10
    iput-boolean p5, p0, Lb62;->m:Z

    .line 11
    .line 12
    iput-object p6, p0, Lb62;->n:Lvv1;

    .line 13
    .line 14
    iput-object p1, p0, Lb62;->o:Li82;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lb62;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lb62;->n:Lvv1;

    .line 4
    .line 5
    iget-object v2, p0, Lb62;->o:Li82;

    .line 6
    .line 7
    iget-object v3, v2, Let;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, Ly02;

    .line 10
    .line 11
    new-instance v4, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object v5, v2, Li82;->m:Lcy1;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    iget-object v6, p0, Lb62;->k:Ljava/lang/String;

    .line 19
    .line 20
    if-nez v5, :cond_0

    .line 21
    .line 22
    :try_start_1
    iget-object p0, v3, Ly02;->o:Lzy1;

    .line 23
    .line 24
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 28
    .line 29
    const-string v2, "Failed to get user properties; not connected to service"

    .line 30
    .line 31
    invoke-virtual {p0, v2, v0, v6}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    iget-object p0, v3, Ly02;->r:Lcb2;

    .line 35
    .line 36
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1, v4}, Lcb2;->d0(Lvv1;Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto/16 :goto_3

    .line 45
    .line 46
    :catch_0
    move-exception p0

    .line 47
    goto :goto_2

    .line 48
    :cond_0
    :try_start_2
    iget-object v7, p0, Lb62;->l:Lbc2;

    .line 49
    .line 50
    iget-boolean p0, p0, Lb62;->m:Z

    .line 51
    .line 52
    invoke-interface {v5, v0, v6, p0, v7}, Lcy1;->C(Ljava/lang/String;Ljava/lang/String;ZLbc2;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v5, Landroid/os/Bundle;

    .line 57
    .line 58
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 59
    .line 60
    .line 61
    if-nez p0, :cond_1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-eqz v6, :cond_5

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    check-cast v6, Lwa2;

    .line 79
    .line 80
    iget-object v7, v6, Lwa2;->n:Ljava/lang/String;
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    .line 82
    iget-object v8, v6, Lwa2;->k:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v7, :cond_3

    .line 85
    .line 86
    :try_start_3
    invoke-virtual {v5, v8, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    iget-object v7, v6, Lwa2;->m:Ljava/lang/Long;

    .line 91
    .line 92
    if-eqz v7, :cond_4

    .line 93
    .line 94
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 95
    .line 96
    .line 97
    move-result-wide v6

    .line 98
    invoke-virtual {v5, v8, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_4
    iget-object v6, v6, Lwa2;->p:Ljava/lang/Double;

    .line 103
    .line 104
    if-eqz v6, :cond_2

    .line 105
    .line 106
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    .line 107
    .line 108
    .line 109
    move-result-wide v6

    .line 110
    invoke-virtual {v5, v8, v6, v7}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_5
    :goto_1
    :try_start_4
    invoke-virtual {v2}, Li82;->y()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 115
    .line 116
    .line 117
    iget-object p0, v3, Ly02;->r:Lcb2;

    .line 118
    .line 119
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v1, v5}, Lcb2;->d0(Lvv1;Landroid/os/Bundle;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :catchall_1
    move-exception p0

    .line 127
    move-object v4, v5

    .line 128
    goto :goto_3

    .line 129
    :catch_1
    move-exception p0

    .line 130
    move-object v4, v5

    .line 131
    :goto_2
    :try_start_5
    iget-object v2, v3, Ly02;->o:Lzy1;

    .line 132
    .line 133
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 134
    .line 135
    .line 136
    iget-object v2, v2, Lzy1;->o:Lso;

    .line 137
    .line 138
    const-string v5, "Failed to get user properties; remote exception"

    .line 139
    .line 140
    invoke-virtual {v2, v5, v0, p0}, Lso;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 141
    .line 142
    .line 143
    iget-object p0, v3, Ly02;->r:Lcb2;

    .line 144
    .line 145
    invoke-static {p0}, Ly02;->j(Let;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, v1, v4}, Lcb2;->d0(Lvv1;Landroid/os/Bundle;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :goto_3
    iget-object v0, v3, Ly02;->r:Lcb2;

    .line 153
    .line 154
    invoke-static {v0}, Ly02;->j(Let;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v1, v4}, Lcb2;->d0(Lvv1;Landroid/os/Bundle;)V

    .line 158
    .line 159
    .line 160
    throw p0
.end method
