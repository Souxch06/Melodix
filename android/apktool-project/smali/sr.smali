.class public final Lsr;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lqt;

.field public final c:Lxn0;

.field public final d:J

.field public e:Ls7;

.field public f:Ls7;

.field public g:Lor;

.field public final h:Lpd0;

.field public final i:Lm30;

.field public final j:Ll4;

.field public final k:Ll4;

.field public final l:Llr;

.field public final m:Ltr;

.field public final n:Lny0;

.field public final o:Lc9;


# direct methods
.method public constructor <init>(Lu30;Lpd0;Ltr;Lqt;Ll4;Ll4;Lm30;Llr;Lny0;Lc9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lsr;->b:Lqt;

    .line 5
    .line 6
    invoke-virtual {p1}, Lu30;->a()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p1, Lu30;->a:Landroid/content/Context;

    .line 10
    .line 11
    iput-object p1, p0, Lsr;->a:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Lsr;->h:Lpd0;

    .line 14
    .line 15
    iput-object p3, p0, Lsr;->m:Ltr;

    .line 16
    .line 17
    iput-object p5, p0, Lsr;->j:Ll4;

    .line 18
    .line 19
    iput-object p6, p0, Lsr;->k:Ll4;

    .line 20
    .line 21
    iput-object p7, p0, Lsr;->i:Lm30;

    .line 22
    .line 23
    iput-object p8, p0, Lsr;->l:Llr;

    .line 24
    .line 25
    iput-object p9, p0, Lsr;->n:Lny0;

    .line 26
    .line 27
    iput-object p10, p0, Lsr;->o:Lc9;

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide p1

    .line 33
    iput-wide p1, p0, Lsr;->d:J

    .line 34
    .line 35
    new-instance p1, Lxn0;

    .line 36
    .line 37
    const/4 p2, 0x5

    .line 38
    invoke-direct {p1, p2}, Lxn0;-><init>(I)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lsr;->c:Lxn0;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final a(Ldn;)V
    .locals 3

    .line 1
    invoke-static {}, Lc9;->h()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lc9;->h()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lsr;->e:Ls7;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object v1, v0, Ls7;->l:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Lm30;

    .line 15
    .line 16
    iget-object v0, v0, Ls7;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    new-instance v2, Ljava/io/File;

    .line 21
    .line 22
    iget-object v1, v1, Lm30;->l:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Ljava/io/File;

    .line 25
    .line 26
    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :catch_0
    :try_start_1
    iget-object v0, p0, Lsr;->j:Ll4;

    .line 33
    .line 34
    new-instance v1, Lqr;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lqr;-><init>(Lsr;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll4;->i(Lqr;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lsr;->g:Lor;

    .line 43
    .line 44
    invoke-virtual {v0}, Lor;->e()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ldn;->f()Lp51;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lp51;->b:Ln51;

    .line 52
    .line 53
    iget-boolean v0, v0, Ln51;->a:Z

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Lsr;->g:Lor;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lc9;->h()V

    .line 63
    .line 64
    .line 65
    iget-object v1, v0, Lor;->n:Lys;

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    iget-object v1, v1, Lys;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 73
    .line 74
    .line 75
    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    if-eqz v1, :cond_0

    .line 77
    .line 78
    move v1, v2

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    const/4 v1, 0x0

    .line 81
    :goto_0
    if-eqz v1, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    :try_start_2
    invoke-virtual {v0, v2, p1, v2}, Lor;->a(ZLdn;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .line 86
    .line 87
    :catch_1
    :goto_1
    :try_start_3
    iget-object v0, p0, Lsr;->g:Lor;

    .line 88
    .line 89
    iget-object p1, p1, Ldn;->h:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Llb1;

    .line 98
    .line 99
    iget-object p1, p1, Llb1;->a:Ljd2;

    .line 100
    .line 101
    invoke-virtual {v0, p1}, Lor;->f(Ljd2;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 102
    .line 103
    .line 104
    invoke-static {}, Lc9;->h()V

    .line 105
    .line 106
    .line 107
    :try_start_4
    iget-object p0, p0, Lsr;->e:Ls7;

    .line 108
    .line 109
    iget-object p1, p0, Ls7;->l:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast p1, Lm30;

    .line 112
    .line 113
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast p0, Ljava/lang/String;

    .line 116
    .line 117
    new-instance v0, Ljava/io/File;

    .line 118
    .line 119
    iget-object p1, p1, Lm30;->l:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast p1, Ljava/io/File;

    .line 122
    .line 123
    invoke-direct {v0, p1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_2
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 127
    .line 128
    .line 129
    goto :goto_4

    .line 130
    :catchall_0
    move-exception p1

    .line 131
    goto :goto_3

    .line 132
    :cond_2
    :try_start_5
    new-instance p1, Ljava/lang/RuntimeException;

    .line 133
    .line 134
    const-string v0, "Collection of crash reports disabled in Crashlytics settings."

    .line 135
    .line 136
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw p1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 140
    :goto_3
    invoke-static {}, Lc9;->h()V

    .line 141
    .line 142
    .line 143
    :try_start_6
    iget-object p0, p0, Lsr;->e:Ls7;

    .line 144
    .line 145
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v0, Lm30;

    .line 148
    .line 149
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast p0, Ljava/lang/String;

    .line 152
    .line 153
    new-instance v1, Ljava/io/File;

    .line 154
    .line 155
    iget-object v0, v0, Lm30;->l:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast v0, Ljava/io/File;

    .line 158
    .line 159
    invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 163
    .line 164
    .line 165
    :catch_2
    throw p1

    .line 166
    :catch_3
    invoke-static {}, Lc9;->h()V

    .line 167
    .line 168
    .line 169
    :try_start_7
    iget-object p0, p0, Lsr;->e:Ls7;

    .line 170
    .line 171
    iget-object p1, p0, Ls7;->l:Ljava/lang/Object;

    .line 172
    .line 173
    check-cast p1, Lm30;

    .line 174
    .line 175
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast p0, Ljava/lang/String;

    .line 178
    .line 179
    new-instance v0, Ljava/io/File;

    .line 180
    .line 181
    iget-object p1, p1, Lm30;->l:Ljava/lang/Object;

    .line 182
    .line 183
    check-cast p1, Ljava/io/File;

    .line 184
    .line 185
    invoke-direct {v0, p1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :catch_4
    :goto_4
    return-void
.end method
