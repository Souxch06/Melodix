.class public final synthetic Lsf1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lcom/melodix/music/MainActivity;

.field public final synthetic k:Lhz0;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Lhz0;

.field public final synthetic n:Lgz0;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;Lhz0;Ljava/lang/String;Lhz0;Lgz0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lsf1;->j:Lcom/melodix/music/MainActivity;

    .line 5
    .line 6
    iput-object p2, p0, Lsf1;->k:Lhz0;

    .line 7
    .line 8
    iput-object p3, p0, Lsf1;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lsf1;->m:Lhz0;

    .line 11
    .line 12
    iput-object p5, p0, Lsf1;->n:Lgz0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    iget-object v0, p0, Lsf1;->k:Lhz0;

    .line 2
    .line 3
    iget-object v0, v0, Lhz0;->j:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v3, v0

    .line 6
    check-cast v3, Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p0, Lsf1;->m:Lhz0;

    .line 9
    .line 10
    iget-object v0, v0, Lhz0;->j:Ljava/lang/Object;

    .line 11
    .line 12
    move-object v4, v0

    .line 13
    check-cast v4, Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Lsf1;->n:Lgz0;

    .line 16
    .line 17
    iget-wide v5, v0, Lgz0;->j:J

    .line 18
    .line 19
    iget-object v2, p0, Lsf1;->j:Lcom/melodix/music/MainActivity;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_6

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto/16 :goto_6

    .line 34
    .line 35
    :cond_0
    invoke-virtual {v2}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :cond_1
    new-instance v1, Ljava/io/File;

    .line 46
    .line 47
    invoke-direct {v1, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v7, 0x1

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    cmp-long v0, v0, v5

    .line 62
    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    move v0, v7

    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const/4 v0, 0x0

    .line 68
    :goto_0
    invoke-virtual {v2}, Le6;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v8, "style"

    .line 73
    .line 74
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    const-string v10, "Theme.Spotifuck.Settings.Dialog"

    .line 79
    .line 80
    invoke-virtual {v1, v10, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    new-instance v8, Lf4;

    .line 85
    .line 86
    if-eqz v1, :cond_3

    .line 87
    .line 88
    invoke-direct {v8, v2, v1}, Lf4;-><init>(Landroid/content/Context;I)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_3
    invoke-direct {v8, v2}, Lf4;-><init>(Landroid/content/Context;)V

    .line 93
    .line 94
    .line 95
    :goto_1
    iget-object v1, v8, Lf4;->c:Ljava/lang/Object;

    .line 96
    .line 97
    move-object v9, v1

    .line 98
    check-cast v9, Lb4;

    .line 99
    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    const-string v1, "Install"

    .line 103
    .line 104
    :goto_2
    move-object v10, v1

    .line 105
    goto :goto_3

    .line 106
    :cond_4
    const-string v1, "Download"

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :goto_3
    iget-object p0, p0, Lsf1;->l:Ljava/lang/String;

    .line 110
    .line 111
    const-string v1, "A new build of Melodix ("

    .line 112
    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    const-string v0, ") has already been downloaded. Would you like to install it now?"

    .line 116
    .line 117
    :goto_4
    invoke-static {v1, p0, v0}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    goto :goto_5

    .line 122
    :cond_5
    const-string v0, ") is available. Would you like to download and install it now?"

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :goto_5
    const-string v1, "Update Available"

    .line 126
    .line 127
    iput-object v1, v9, Lb4;->d:Ljava/lang/CharSequence;

    .line 128
    .line 129
    iput-object v0, v9, Lb4;->f:Ljava/lang/CharSequence;

    .line 130
    .line 131
    iput-boolean v7, v9, Lb4;->m:Z

    .line 132
    .line 133
    new-instance v1, Luf1;

    .line 134
    .line 135
    invoke-direct/range {v1 .. v6}, Luf1;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;J)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v8, v10, v1}, Lf4;->f(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    const-string v0, "Later"

    .line 142
    .line 143
    const/4 v1, 0x0

    .line 144
    invoke-virtual {v8, v0, v1}, Lf4;->e(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Lr51;

    .line 148
    .line 149
    invoke-direct {v0, v2, p0, v7}, Lr51;-><init>(Landroid/content/Context;Ljava/lang/Comparable;I)V

    .line 150
    .line 151
    .line 152
    const-string p0, "Skip Version"

    .line 153
    .line 154
    iput-object p0, v9, Lb4;->k:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v0, v9, Lb4;->l:Landroid/content/DialogInterface$OnClickListener;

    .line 157
    .line 158
    invoke-virtual {v8}, Lf4;->g()V

    .line 159
    .line 160
    .line 161
    :cond_6
    :goto_6
    return-void
.end method
