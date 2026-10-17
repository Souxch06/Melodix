.class public Lmd1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lgg;
.implements Lcs0;
.implements Lvz0;
.implements Lbb2;
.implements Lwr0;
.implements Lsa1;
.implements Ljq;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    iput p1, p0, Lmd1;->j:I

    .line 2
    .line 3
    sparse-switch p1, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    sget-object p1, Lva0;->c:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance p1, Landroid/util/SparseIntArray;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/util/SparseIntArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 17
    .line 18
    return-void

    .line 19
    :sswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 28
    .line 29
    return-void

    .line 30
    :sswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ljava/util/EnumMap;

    .line 34
    .line 35
    const-class v0, Lt22;

    .line 36
    .line 37
    invoke-direct {p1, v0}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 41
    .line 42
    return-void

    .line 43
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_1
        0x11 -> :sswitch_0
    .end sparse-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 45
    iput p1, p0, Lmd1;->j:I

    iput-object p2, p0, Lmd1;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lfp1;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Lmd1;->j:I

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmd1;->k:Ljava/lang/Object;

    iput-object p0, p1, Lfp1;->a:Lmd1;

    return-void
.end method

.method public constructor <init>(Ljava/util/EnumMap;)V
    .locals 2

    const/16 v0, 0x8

    iput v0, p0, Lmd1;->j:I

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lt22;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 47
    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Lny0;Lmd1;)V
    .locals 0

    const/4 p1, 0x6

    iput p1, p0, Lmd1;->j:I

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lmd1;->k:Ljava/lang/Object;

    return-void
.end method

.method public static k(Ljava/lang/String;)Lmd1;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Lu22;->e(C)Lq22;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    sget-object p0, Lq22;->k:Lq22;

    .line 26
    .line 27
    :goto_1
    new-instance v0, Lmd1;

    .line 28
    .line 29
    const/16 v1, 0x9

    .line 30
    .line 31
    invoke-direct {v0, v1, p0}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lxa0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lxa0;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p2, Llb1;

    .line 2
    .line 3
    check-cast p1, Lf42;

    .line 4
    .line 5
    sget v0, Lu32;->j:I

    .line 6
    .line 7
    new-instance v0, Lg32;

    .line 8
    .line 9
    invoke-direct {v0, p2}, Lg32;-><init>(Llb1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljg;->s()Landroid/os/IInterface;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ld42;

    .line 17
    .line 18
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Lf62;

    .line 21
    .line 22
    invoke-virtual {p0}, Lqo1;->a()[B

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1}, Lfl1;->F()Landroid/os/Parcel;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2, v0}, Lwu1;->c(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p0}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x1f

    .line 37
    .line 38
    invoke-virtual {p1, p2, p0}, Lfl1;->G(Landroid/os/Parcel;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lc52;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p1, "auto"

    .line 12
    .line 13
    const-string p2, "_err"

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lc52;->p(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "Unexpected call on client side"

    .line 20
    .line 21
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c()Lld1;
    .locals 7

    .line 1
    invoke-static {}, Lld1;->H()Lid1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/google/firebase/perf/metrics/Trace;->m:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lid1;->n(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 19
    .line 20
    iget-wide v1, v1, Loc1;->j:J

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lid1;->l(J)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 28
    .line 29
    iget-object v2, v1, Lcom/google/firebase/perf/metrics/Trace;->t:Loc1;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/google/firebase/perf/metrics/Trace;->u:Loc1;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Loc1;->c(Loc1;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    invoke-virtual {v0, v1, v2}, Lid1;->m(J)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/google/firebase/perf/metrics/Trace;->n:Ljava/util/concurrent/ConcurrentHashMap;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lfr;

    .line 65
    .line 66
    iget-object v3, v2, Lfr;->j:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v2, v2, Lfr;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 71
    .line 72
    .line 73
    move-result-wide v4

    .line 74
    invoke-virtual {v0, v3, v4, v5}, Lid1;->k(Ljava/lang/String;J)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    iget-object v1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/google/firebase/perf/metrics/Trace;->q:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-nez v2, :cond_1

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    const/4 v3, 0x0

    .line 95
    move v4, v3

    .line 96
    :goto_1
    if-ge v4, v2, :cond_1

    .line 97
    .line 98
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    add-int/lit8 v4, v4, 0x1

    .line 103
    .line 104
    check-cast v5, Lcom/google/firebase/perf/metrics/Trace;

    .line 105
    .line 106
    new-instance v6, Lmd1;

    .line 107
    .line 108
    invoke-direct {v6, v3, v5}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v6}, Lmd1;->c()Lld1;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-virtual {v0, v5}, Lid1;->j(Lld1;)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_1
    iget-object v1, p0, Lmd1;->k:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/google/firebase/perf/metrics/Trace;->getAttributes()Ljava/util/Map;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v0}, Lea0;->i()V

    .line 128
    .line 129
    .line 130
    iget-object v2, v0, Lea0;->k:Lia0;

    .line 131
    .line 132
    check-cast v2, Lld1;

    .line 133
    .line 134
    invoke-virtual {v2}, Lld1;->G()Lml0;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v2, v1}, Lml0;->putAll(Ljava/util/Map;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast p0, Lcom/google/firebase/perf/metrics/Trace;

    .line 144
    .line 145
    iget-object v1, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 146
    .line 147
    monitor-enter v1

    .line 148
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Lcom/google/firebase/perf/metrics/Trace;->p:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    :cond_2
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    if-eqz v3, :cond_3

    .line 164
    .line 165
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lct0;

    .line 170
    .line 171
    if-eqz v3, :cond_2

    .line 172
    .line 173
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :catchall_0
    move-exception p0

    .line 178
    goto :goto_3

    .line 179
    :cond_3
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    invoke-static {p0}, Lct0;->b(Ljava/util/List;)[Lbt0;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    if-eqz p0, :cond_4

    .line 189
    .line 190
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-virtual {v0}, Lea0;->i()V

    .line 195
    .line 196
    .line 197
    iget-object v1, v0, Lea0;->k:Lia0;

    .line 198
    .line 199
    check-cast v1, Lld1;

    .line 200
    .line 201
    invoke-virtual {v1, p0}, Lld1;->r(Ljava/util/List;)V

    .line 202
    .line 203
    .line 204
    :cond_4
    invoke-virtual {v0}, Lea0;->h()Lia0;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    check-cast p0, Lld1;

    .line 209
    .line 210
    return-object p0

    .line 211
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    throw p0
.end method

.method public bridge synthetic d(Ljd2;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p0, v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setBackForwardCacheEnabled(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 4
    .line 5
    sget-object v0, Lw00;->j:Lw00;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setRequestedWithHeaderOriginAllowList(Ljava/util/Set;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g(Ljava/lang/String;Z)Ly82;
    .locals 1

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcb0;

    .line 4
    .line 5
    new-instance v0, Ly82;

    .line 6
    .line 7
    invoke-direct {v0, p1, p0, p2}, Ly82;-><init>(Ljava/lang/String;Lcb0;Z)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Lmd1;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lec2;

    .line 9
    .line 10
    iget-object v0, p0, Lec2;->c:Lsa1;

    .line 11
    .line 12
    invoke-interface {v0}, Lsa1;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lho0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lec2;->b:Lsa1;

    .line 22
    .line 23
    invoke-interface {v1}, Lsa1;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lv62;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    iget-object v1, v1, Lv62;->a:Lu32;

    .line 33
    .line 34
    invoke-static {}, Lo80;->b()Lo80;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    new-instance v3, Lny0;

    .line 39
    .line 40
    const/16 v4, 0x17

    .line 41
    .line 42
    invoke-direct {v3, v4, v1}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iput-object v3, v2, Lo80;->b:Ljava/lang/Object;

    .line 46
    .line 47
    sget-object v3, Ldl1;->g:Lu20;

    .line 48
    .line 49
    filled-new-array {v3}, [Lu20;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iput-object v3, v2, Lo80;->c:Ljava/lang/Object;

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    iput-boolean v3, v2, Lo80;->a:Z

    .line 57
    .line 58
    invoke-virtual {v2}, Lo80;->a()Lo80;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v3, v2}, Lua0;->b(ILo80;)Ljd2;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v1}, Lv62;->b(Ljd2;)Lj;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget-object v2, Ljr1;->e:Ljr1;

    .line 71
    .line 72
    new-instance v3, Lk;

    .line 73
    .line 74
    const-class v4, Lq62;

    .line 75
    .line 76
    invoke-direct {v3, v1, v4, v2}, Ll;-><init>(Lqj0;Ljava/lang/Class;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v3}, Lrs0;->o(Ljava/util/concurrent/Executor;Lj60;)Ljava/util/concurrent/Executor;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v1, v3, v2}, Lqj0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 84
    .line 85
    .line 86
    new-instance v1, Lha2;

    .line 87
    .line 88
    const/4 v2, 0x1

    .line 89
    invoke-direct {v1, v2, p0}, Lha2;-><init>(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    sget p0, Lv0;->t:I

    .line 93
    .line 94
    new-instance p0, Lu0;

    .line 95
    .line 96
    invoke-direct {p0, v3, v1}, Lv0;-><init>(Lqj0;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, p0}, Lrs0;->o(Ljava/util/concurrent/Executor;Lj60;)Ljava/util/concurrent/Executor;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-interface {v3, p0, v1}, Lqj0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 104
    .line 105
    .line 106
    new-instance v1, Ldc2;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ldc2;-><init>(Lk60;)V

    .line 109
    .line 110
    .line 111
    invoke-interface {p0, v1, v0}, Lqj0;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 112
    .line 113
    .line 114
    return-object p0

    .line 115
    :pswitch_0
    sget-object v0, Le52;->j:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast p0, Lsa1;

    .line 118
    .line 119
    invoke-interface {p0}, Lsa1;->get()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    check-cast p0, Lhs0;

    .line 124
    .line 125
    invoke-virtual {p0}, Lhs0;->c()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    check-cast p0, Lvb2;

    .line 130
    .line 131
    return-object p0

    .line 132
    :pswitch_1
    check-cast p0, Li7;

    .line 133
    .line 134
    new-instance v0, Ltb2;

    .line 135
    .line 136
    iget-object p0, p0, Li7;->k:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast p0, Lsa1;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Ltb2;-><init>(Lsa1;)V

    .line 141
    .line 142
    .line 143
    new-instance p0, Lxu0;

    .line 144
    .line 145
    invoke-direct {p0, v0}, Lxu0;-><init>(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    return-object p0

    .line 149
    :pswitch_data_0
    .packed-switch 0xd
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public h(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lmd1;

    .line 6
    .line 7
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Llb1;

    .line 10
    .line 11
    iget-object p0, p0, Llb1;->a:Ljd2;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljd2;->o()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(Lt22;I)V
    .locals 1

    .line 1
    const/16 v0, -0x1e

    .line 2
    .line 3
    if-eq p2, v0, :cond_3

    .line 4
    .line 5
    const/16 v0, -0x14

    .line 6
    .line 7
    if-eq p2, v0, :cond_2

    .line 8
    .line 9
    const/16 v0, -0xa

    .line 10
    .line 11
    if-eq p2, v0, :cond_1

    .line 12
    .line 13
    if-eqz p2, :cond_2

    .line 14
    .line 15
    const/16 v0, 0x1e

    .line 16
    .line 17
    if-eq p2, v0, :cond_0

    .line 18
    .line 19
    sget-object p2, Lot1;->k:Lot1;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object p2, Lot1;->o:Lot1;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object p2, Lot1;->n:Lot1;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    sget-object p2, Lot1;->p:Lot1;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_3
    sget-object p2, Lot1;->q:Lot1;

    .line 32
    .line 33
    :goto_0
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p0, Ljava/util/EnumMap;

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public j(Ljd2;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lm42;

    .line 4
    .line 5
    iget-boolean v0, p1, Ljd2;->d:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lc0;->cancel(Z)Z

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljd2;->j()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ljd2;->h()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lc0;->l(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p1}, Ljd2;->g()Ljava/lang/Exception;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lc0;->m(Ljava/lang/Throwable;)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 39
    .line 40
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 41
    .line 42
    .line 43
    throw p0
.end method

.method public l(Lt22;Lot1;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/EnumMap;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(ILjava/lang/Object;Lvq1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lfp1;

    .line 4
    .line 5
    check-cast p2, Lqo1;

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    invoke-virtual {v0, p1, v1}, Lfp1;->d(II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p3}, Lqo1;->b(Lvq1;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {v0, p1}, Lfp1;->r(I)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p3, p2, p0}, Lvq1;->b(Ljava/lang/Object;Lmd1;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onConnected()V
    .locals 0

    .line 1
    iget-object p0, p0, Lmd1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lxa0;

    .line 4
    .line 5
    invoke-interface {p0}, Lxa0;->onConnected()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget v0, p0, Lmd1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "1"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lt22;->values()[Lt22;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    array-length v2, v1

    .line 23
    const/4 v3, 0x0

    .line 24
    :goto_0
    if-ge v3, v2, :cond_1

    .line 25
    .line 26
    aget-object v4, v1, v3

    .line 27
    .line 28
    iget-object v5, p0, Lmd1;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v5, Ljava/util/EnumMap;

    .line 31
    .line 32
    invoke-virtual {v5, v4}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    check-cast v4, Lot1;

    .line 37
    .line 38
    if-nez v4, :cond_0

    .line 39
    .line 40
    sget-object v4, Lot1;->k:Lot1;

    .line 41
    .line 42
    :cond_0
    iget-char v4, v4, Lot1;->j:C

    .line 43
    .line 44
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
    .end packed-switch
.end method
