.class public final synthetic Luf1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:Lcom/melodix/music/MainActivity;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:J


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Luf1;->j:Lcom/melodix/music/MainActivity;

    .line 5
    .line 6
    iput-object p2, p0, Luf1;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Luf1;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-wide p4, p0, Luf1;->m:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 10

    .line 1
    iget-object p1, p0, Luf1;->l:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v2, p0, Luf1;->j:Lcom/melodix/music/MainActivity;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :try_start_0
    invoke-virtual {p2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    move v3, v1

    .line 23
    :goto_0
    array-length v4, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 24
    if-ge v3, v4, :cond_2

    .line 25
    .line 26
    add-int/lit8 v4, v3, 0x1

    .line 27
    .line 28
    :try_start_1
    aget-object v3, v0, v3
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 29
    .line 30
    :try_start_2
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    const-string v6, ".apk"

    .line 44
    .line 45
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_1

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-static {v5, p1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-nez v5, :cond_1

    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 62
    .line 63
    .line 64
    :cond_1
    move v3, v4

    .line 65
    goto :goto_0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    new-instance v3, Ljava/util/NoSuchElementException;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-direct {v3, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    throw v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 77
    :catch_1
    :cond_2
    new-instance v3, Ljava/io/File;

    .line 78
    .line 79
    invoke-direct {v3, p2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-wide v4, p0, Luf1;->m:J

    .line 87
    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 91
    .line 92
    .line 93
    move-result-wide p1

    .line 94
    cmp-long p1, p1, v4

    .line 95
    .line 96
    if-nez p1, :cond_3

    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    invoke-static {v2, v3}, Lju1;->t(Lcom/melodix/music/MainActivity;Ljava/io/File;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    const p1, 0x7f090187

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, p1}, Le6;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    move-object v6, p1

    .line 113
    check-cast v6, Landroid/widget/ProgressBar;

    .line 114
    .line 115
    if-nez v6, :cond_4

    .line 116
    .line 117
    const-string p0, "Error: Progress indicator not found"

    .line 118
    .line 119
    invoke-static {v2, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_4
    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getProgressTintList()Landroid/content/res/ColorStateList;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    invoke-virtual {v6}, Landroid/widget/ProgressBar;->getIndeterminateTintList()Landroid/content/res/ColorStateList;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    invoke-virtual {v6}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    const/4 p1, 0x1

    .line 140
    sput-boolean p1, Lju1;->w:Z

    .line 141
    .line 142
    new-instance p1, La3;

    .line 143
    .line 144
    const/16 p2, 0xb

    .line 145
    .line 146
    invoke-direct {p1, p2, v6}, La3;-><init>(ILjava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 150
    .line 151
    .line 152
    new-instance p1, Ljava/lang/Thread;

    .line 153
    .line 154
    new-instance v0, Lvf1;

    .line 155
    .line 156
    iget-object v1, p0, Luf1;->k:Ljava/lang/String;

    .line 157
    .line 158
    invoke-direct/range {v0 .. v9}, Lvf1;-><init>(Ljava/lang/String;Lcom/melodix/music/MainActivity;Ljava/io/File;JLandroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    .line 159
    .line 160
    .line 161
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 165
    .line 166
    .line 167
    :goto_1
    return-void
.end method
