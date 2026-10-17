.class public final synthetic Lab2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Le52;

.field public final synthetic k:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Le52;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lab2;->j:Le52;

    .line 5
    .line 6
    iput-object p2, p0, Lab2;->k:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 1
    iget-object v0, p0, Lab2;->j:Le52;

    .line 2
    .line 3
    iget-object v0, v0, Le52;->b:Landroid/content/Context;

    .line 4
    .line 5
    const-string v1, "phenotype/"

    .line 6
    .line 7
    sget-object v2, Ldb2;->l:Lrz0;

    .line 8
    .line 9
    if-nez v2, :cond_6

    .line 10
    .line 11
    sget-object v3, Ldb2;->k:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v3

    .line 14
    :try_start_0
    sget-object v2, Ldb2;->l:Lrz0;

    .line 15
    .line 16
    if-nez v2, :cond_5

    .line 17
    .line 18
    new-instance v2, Lo7;

    .line 19
    .line 20
    const/4 v4, 0x4

    .line 21
    invoke-direct {v2, v4}, Lo7;-><init>(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    :try_start_1
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const-string v5, "phenotype"

    .line 29
    .line 30
    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    if-eqz v4, :cond_4

    .line 35
    .line 36
    array-length v5, v4

    .line 37
    const/4 v6, 0x0

    .line 38
    :goto_0
    if-ge v6, v5, :cond_4

    .line 39
    .line 40
    aget-object v7, v4, v6

    .line 41
    .line 42
    const-string v8, "_package_metadata.binarypb"

    .line 43
    .line 44
    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    if-nez v8, :cond_0

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_0
    :try_start_2
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v9

    .line 59
    add-int/lit8 v9, v9, 0xa

    .line 60
    .line 61
    new-instance v10, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v9

    .line 76
    invoke-virtual {v8, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 77
    .line 78
    .line 79
    move-result-object v8
    :try_end_2
    .catch Laq1; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    :try_start_3
    new-instance v9, Ldb2;

    .line 81
    .line 82
    sget-object v10, Lgp1;->a:Lgp1;

    .line 83
    .line 84
    sget v10, Lso1;->a:I

    .line 85
    .line 86
    sget-object v10, Lgp1;->b:Lgp1;

    .line 87
    .line 88
    invoke-static {v8, v10}, Leb2;->t(Ljava/io/InputStream;Lgp1;)Leb2;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v10}, Leb2;->s()Z

    .line 96
    .line 97
    .line 98
    move-result v11

    .line 99
    if-eqz v11, :cond_1

    .line 100
    .line 101
    invoke-virtual {v10}, Leb2;->r()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v10

    .line 105
    invoke-static {v0, v10}, Lz42;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    goto :goto_1

    .line 110
    :cond_1
    invoke-virtual {v10}, Leb2;->r()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v10

    .line 114
    :goto_1
    iput-object v10, v9, Ldb2;->j:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v10, v9, Ldb2;->j:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v2, v10, v9}, Lo7;->g(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 119
    .line 120
    .line 121
    if-eqz v8, :cond_3

    .line 122
    .line 123
    :try_start_4
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Laq1; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 124
    .line 125
    .line 126
    goto :goto_3

    .line 127
    :catchall_0
    move-exception p0

    .line 128
    goto :goto_4

    .line 129
    :catchall_1
    move-exception v9

    .line 130
    if-eqz v8, :cond_2

    .line 131
    .line 132
    :try_start_5
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :catchall_2
    move-exception v8

    .line 137
    :try_start_6
    invoke-virtual {v9, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    :cond_2
    :goto_2
    throw v9
    :try_end_6
    .catch Laq1; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 141
    :catch_0
    :try_start_7
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    add-int/lit8 v7, v7, 0x2d

    .line 146
    .line 147
    new-instance v8, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 150
    .line 151
    .line 152
    :cond_3
    :goto_3
    add-int/lit8 v6, v6, 0x1

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :catch_1
    :cond_4
    const/4 v0, 0x1

    .line 156
    :try_start_8
    invoke-virtual {v2, v0}, Lo7;->b(Z)Lrz0;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    sput-object v0, Ldb2;->l:Lrz0;

    .line 161
    .line 162
    move-object v2, v0

    .line 163
    :cond_5
    monitor-exit v3

    .line 164
    goto :goto_5

    .line 165
    :goto_4
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 166
    throw p0

    .line 167
    :cond_6
    :goto_5
    iget-object p0, p0, Lab2;->k:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v2, p0}, Lrz0;->containsKey(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-nez v0, :cond_7

    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    add-int/lit16 p0, p0, 0xad

    .line 182
    .line 183
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 184
    .line 185
    .line 186
    :cond_7
    return-void
.end method
