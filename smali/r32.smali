.class public final Lr32;
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
    iput-object p2, p0, Lr32;->j:Landroid/os/Bundle;

    .line 5
    .line 6
    iput-object p1, p0, Lr32;->k:Lc52;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "app_id"

    .line 4
    .line 5
    iget-object v2, v0, Lr32;->k:Lc52;

    .line 6
    .line 7
    invoke-virtual {v2}, Lgx1;->l()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2}, Lay1;->m()V

    .line 11
    .line 12
    .line 13
    const-string v3, "name"

    .line 14
    .line 15
    iget-object v0, v0, Lr32;->j:Landroid/os/Bundle;

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v8

    .line 21
    const-string v3, "origin"

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v12

    .line 27
    invoke-static {v8}, Lbh;->e(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v12}, Lbh;->e(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v3, "value"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-static {v4}, Lbh;->h(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v2, Let;->j:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v2, Ly02;

    .line 45
    .line 46
    invoke-virtual {v2}, Ly02;->e()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-nez v4, :cond_0

    .line 51
    .line 52
    iget-object v0, v2, Ly02;->o:Lzy1;

    .line 53
    .line 54
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, Lzy1;->w:Lso;

    .line 58
    .line 59
    const-string v1, "Conditional property not set since app measurement is disabled"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    new-instance v4, Lwa2;

    .line 66
    .line 67
    const-string v5, "triggered_timestamp"

    .line 68
    .line 69
    invoke-virtual {v0, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v5

    .line 73
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v7

    .line 77
    move-object v9, v12

    .line 78
    invoke-direct/range {v4 .. v9}, Lwa2;-><init>(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :try_start_0
    iget-object v9, v2, Ly02;->r:Lcb2;

    .line 82
    .line 83
    invoke-static {v9}, Ly02;->j(Let;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    const-string v3, "triggered_event_name"

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    const-string v3, "triggered_event_params"

    .line 96
    .line 97
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 98
    .line 99
    .line 100
    move-result-object v11

    .line 101
    const-wide/16 v15, 0x0

    .line 102
    .line 103
    const/16 v17, 0x1

    .line 104
    .line 105
    const-wide/16 v13, 0x0

    .line 106
    .line 107
    invoke-virtual/range {v9 .. v17}, Lcb2;->S(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JJZ)Ltu1;

    .line 108
    .line 109
    .line 110
    move-result-object v20

    .line 111
    invoke-static {v9}, Ly02;->j(Let;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    const-string v3, "timed_out_event_name"

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v10

    .line 123
    const-string v3, "timed_out_event_params"

    .line 124
    .line 125
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 126
    .line 127
    .line 128
    move-result-object v11

    .line 129
    const-wide/16 v15, 0x0

    .line 130
    .line 131
    const/16 v17, 0x1

    .line 132
    .line 133
    const-wide/16 v13, 0x0

    .line 134
    .line 135
    invoke-virtual/range {v9 .. v17}, Lcb2;->S(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JJZ)Ltu1;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    const-string v5, "expired_event_name"

    .line 143
    .line 144
    invoke-virtual {v0, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v10

    .line 148
    const-string v5, "expired_event_params"

    .line 149
    .line 150
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 151
    .line 152
    .line 153
    move-result-object v11

    .line 154
    const-wide/16 v15, 0x0

    .line 155
    .line 156
    const/16 v17, 0x1

    .line 157
    .line 158
    const-wide/16 v13, 0x0

    .line 159
    .line 160
    invoke-virtual/range {v9 .. v17}, Lcb2;->S(Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;JJZ)Ltu1;

    .line 161
    .line 162
    .line 163
    move-result-object v23
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    new-instance v9, Lsr1;

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v10

    .line 170
    const-string v1, "creation_timestamp"

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 173
    .line 174
    .line 175
    move-result-wide v13

    .line 176
    const-string v1, "trigger_event_name"

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v16

    .line 182
    const-string v1, "trigger_timeout"

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 185
    .line 186
    .line 187
    move-result-wide v18

    .line 188
    const-string v1, "time_to_live"

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 191
    .line 192
    .line 193
    move-result-wide v21

    .line 194
    const/4 v15, 0x0

    .line 195
    move-object/from16 v17, v3

    .line 196
    .line 197
    move-object v11, v12

    .line 198
    move-object v12, v4

    .line 199
    invoke-direct/range {v9 .. v23}, Lsr1;-><init>(Ljava/lang/String;Ljava/lang/String;Lwa2;JZLjava/lang/String;Ltu1;JLtu1;JLtu1;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ly02;->n()Li82;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0, v9}, Li82;->E(Lsr1;)V

    .line 207
    .line 208
    .line 209
    :catch_0
    return-void
.end method
