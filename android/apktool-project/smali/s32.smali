.class public final Ls32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Landroid/os/Bundle;

.field public final synthetic k:Lc52;


# direct methods
.method public constructor <init>(Lc52;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ls32;->j:Landroid/os/Bundle;

    .line 5
    .line 6
    iput-object p1, p0, Ls32;->k:Lc52;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "creation_timestamp"

    .line 4
    .line 5
    const-string v2, "app_id"

    .line 6
    .line 7
    iget-object v3, v0, Ls32;->k:Lc52;

    .line 8
    .line 9
    invoke-virtual {v3}, Lgx1;->l()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v3}, Lay1;->m()V

    .line 13
    .line 14
    .line 15
    const-string v4, "name"

    .line 16
    .line 17
    iget-object v0, v0, Ls32;->j:Landroid/os/Bundle;

    .line 18
    .line 19
    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v9

    .line 23
    invoke-static {v9}, Lbh;->e(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, v3, Let;->j:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v3, Ly02;

    .line 29
    .line 30
    invoke-virtual {v3}, Ly02;->e()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-nez v4, :cond_0

    .line 35
    .line 36
    iget-object v0, v3, Ly02;->o:Lzy1;

    .line 37
    .line 38
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 42
    .line 43
    const-string v1, "Conditional property not cleared since app measurement is disabled"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance v5, Lwa2;

    .line 50
    .line 51
    const-wide/16 v6, 0x0

    .line 52
    .line 53
    const/4 v8, 0x0

    .line 54
    const-string v10, ""

    .line 55
    .line 56
    invoke-direct/range {v5 .. v10}, Lwa2;-><init>(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :try_start_0
    iget-object v6, v3, Ly02;->r:Lcb2;

    .line 60
    .line 61
    invoke-static {v6}, Ly02;->j(Let;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    const-string v4, "expired_event_name"

    .line 68
    .line 69
    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    const-string v4, "expired_event_params"

    .line 74
    .line 75
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    const-string v9, ""

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v10

    .line 85
    const-wide/16 v12, 0x0

    .line 86
    .line 87
    const/4 v14, 0x1

    .line 88
    invoke-virtual/range {v6 .. v14}, Lcb2;->S(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JJZ)Ltu1;

    .line 89
    .line 90
    .line 91
    move-result-object v18
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    new-instance v4, Lsr1;

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v8

    .line 102
    const-string v1, "active"

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v10

    .line 108
    const-string v1, "trigger_event_name"

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v11

    .line 114
    const-string v1, "trigger_timeout"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 117
    .line 118
    .line 119
    move-result-wide v13

    .line 120
    const-string v1, "time_to_live"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 123
    .line 124
    .line 125
    move-result-wide v16

    .line 126
    const/4 v12, 0x0

    .line 127
    const/4 v15, 0x0

    .line 128
    const-string v6, ""

    .line 129
    .line 130
    move-object v7, v5

    .line 131
    move-object v5, v2

    .line 132
    invoke-direct/range {v4 .. v18}, Lsr1;-><init>(Ljava/lang/String;Ljava/lang/String;Lwa2;JZLjava/lang/String;Ltu1;JLtu1;JLtu1;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3}, Ly02;->n()Li82;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v4}, Li82;->E(Lsr1;)V

    .line 140
    .line 141
    .line 142
    :catch_0
    return-void
.end method
