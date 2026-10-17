.class public final Lag0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final synthetic d:[Lch0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/ThreadLocal;

.field public final c:Lvt0;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lxv0;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    sget-object v1, Lii;->j:Lii;

    .line 5
    .line 6
    const-class v2, Lag0;

    .line 7
    .line 8
    const-string v3, "dataStore"

    .line 9
    .line 10
    const-string v4, "getDataStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;"

    .line 11
    .line 12
    invoke-direct/range {v0 .. v5}, Lyv0;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Liz0;->a:Ljz0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    new-array v1, v1, [Lch0;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    aput-object v0, v1, v2

    .line 25
    .line 26
    sput-object v1, Lag0;->d:[Lch0;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Lag0;->a:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lag0;->b:Ljava/lang/ThreadLocal;

    .line 15
    .line 16
    new-instance v0, Lpa0;

    .line 17
    .line 18
    new-instance v1, Lq4;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lq4;-><init>(Lag0;)V

    .line 21
    .line 22
    .line 23
    const/16 v2, 0x15

    .line 24
    .line 25
    invoke-direct {v0, v2, v1}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Lm;

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-direct {v1, v2, p0}, Lm;-><init>(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    sget-object v3, Lfy;->a:Lyv;

    .line 35
    .line 36
    sget-object v3, Llv;->l:Llv;

    .line 37
    .line 38
    new-instance v4, Lra1;

    .line 39
    .line 40
    invoke-direct {v4}, Lhg0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    sget-object v5, Ls00;->j:Ls00;

    .line 47
    .line 48
    if-ne v4, v5, :cond_0

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_0
    invoke-interface {v4}, Lqq;->getKey()Lrq;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-interface {v3, v5}, Lsq;->l(Lrq;)Lsq;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    sget-object v5, Ls00;->j:Ls00;

    .line 60
    .line 61
    if-ne v3, v5, :cond_1

    .line 62
    .line 63
    move-object v3, v4

    .line 64
    goto :goto_1

    .line 65
    :cond_1
    sget-object v6, Lok0;->l:Lok0;

    .line 66
    .line 67
    invoke-interface {v3, v6}, Lsq;->j(Lrq;)Lqq;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    check-cast v7, Luq;

    .line 72
    .line 73
    if-nez v7, :cond_2

    .line 74
    .line 75
    new-instance v5, Lkl;

    .line 76
    .line 77
    invoke-direct {v5, v3, v4}, Lkl;-><init>(Lsq;Lqq;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    move-object v3, v5

    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-interface {v3, v6}, Lsq;->l(Lrq;)Lsq;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    if-ne v3, v5, :cond_3

    .line 87
    .line 88
    new-instance v3, Lkl;

    .line 89
    .line 90
    invoke-direct {v3, v4, v7}, Lkl;-><init>(Lsq;Lqq;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    new-instance v5, Lkl;

    .line 95
    .line 96
    new-instance v6, Lkl;

    .line 97
    .line 98
    invoke-direct {v6, v3, v4}, Lkl;-><init>(Lsq;Lqq;)V

    .line 99
    .line 100
    .line 101
    invoke-direct {v5, v6, v7}, Lkl;-><init>(Lsq;Lqq;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :goto_1
    invoke-static {v3}, Lfe1;->b(Lsq;)Lgq;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    new-instance v4, Lxt0;

    .line 110
    .line 111
    invoke-direct {v4, p2, v0, v1, v3}, Lxt0;-><init>(Ljava/lang/String;Lpa0;Lr80;Lzq;)V

    .line 112
    .line 113
    .line 114
    sget-object p2, Lag0;->d:[Lch0;

    .line 115
    .line 116
    const/4 v5, 0x0

    .line 117
    aget-object p2, p2, v5

    .line 118
    .line 119
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    iget-object p2, v4, Lxt0;->c:Lvt0;

    .line 123
    .line 124
    if-nez p2, :cond_5

    .line 125
    .line 126
    iget-object p2, v4, Lxt0;->b:Ljava/lang/Object;

    .line 127
    .line 128
    monitor-enter p2

    .line 129
    :try_start_0
    iget-object v6, v4, Lxt0;->c:Lvt0;

    .line 130
    .line 131
    if-nez v6, :cond_4

    .line 132
    .line 133
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1, p1}, Lm;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Ljava/util/List;

    .line 145
    .line 146
    new-instance v6, Lwt0;

    .line 147
    .line 148
    invoke-direct {v6, p1, v4, v5}, Lwt0;-><init>(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 149
    .line 150
    .line 151
    new-instance p1, Lh30;

    .line 152
    .line 153
    sget-object v5, Lok0;->p:Lok0;

    .line 154
    .line 155
    new-instance v7, Lg30;

    .line 156
    .line 157
    invoke-direct {v7, v2, v6}, Lg30;-><init>(ILjava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    sget-object v6, Lf30;->l:Lf30;

    .line 161
    .line 162
    invoke-direct {p1, v5, v6, v7}, Lh30;-><init>(Lm41;Lr80;Lp80;)V

    .line 163
    .line 164
    .line 165
    new-instance v5, Lvt0;

    .line 166
    .line 167
    new-instance v6, Loj;

    .line 168
    .line 169
    const/4 v7, 0x0

    .line 170
    invoke-direct {v6, v1, v7, v2}, Loj;-><init>(Ljava/lang/Object;Liq;I)V

    .line 171
    .line 172
    .line 173
    invoke-static {v6}, Lk42;->k(Ljava/lang/Object;)Ljava/util/List;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    new-instance v2, Lwu;

    .line 178
    .line 179
    invoke-direct {v2, p1, v1, v0, v3}, Lwu;-><init>(Lh30;Ljava/util/List;Lpa0;Lzq;)V

    .line 180
    .line 181
    .line 182
    invoke-direct {v5, v2}, Lvt0;-><init>(Lyt;)V

    .line 183
    .line 184
    .line 185
    new-instance p1, Lvt0;

    .line 186
    .line 187
    invoke-direct {p1, v5}, Lvt0;-><init>(Lyt;)V

    .line 188
    .line 189
    .line 190
    iput-object p1, v4, Lxt0;->c:Lvt0;

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :catchall_0
    move-exception p0

    .line 194
    goto :goto_3

    .line 195
    :cond_4
    :goto_2
    iget-object p1, v4, Lxt0;->c:Lvt0;

    .line 196
    .line 197
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    .line 199
    .line 200
    monitor-exit p2

    .line 201
    move-object p2, p1

    .line 202
    goto :goto_4

    .line 203
    :goto_3
    monitor-exit p2

    .line 204
    throw p0

    .line 205
    :cond_5
    :goto_4
    iput-object p2, p0, Lag0;->c:Lvt0;

    .line 206
    .line 207
    return-void
.end method
