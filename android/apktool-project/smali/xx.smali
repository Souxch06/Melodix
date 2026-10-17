.class public final Lxx;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:[J

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/ArrayList;

.field public e:Z

.field public f:Z

.field public g:Lvx;

.field public h:I

.field public i:J

.field public final synthetic j:Lay;


# direct methods
.method public constructor <init>(Lay;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lxx;->j:Lay;

    .line 8
    .line 9
    iput-object p2, p0, Lxx;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x2

    .line 15
    new-array v0, p1, [J

    .line 16
    .line 17
    iput-object v0, p0, Lxx;->b:[J

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lxx;->c:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lxx;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/16 p2, 0x2e

    .line 39
    .line 40
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/4 v1, 0x0

    .line 48
    :goto_0
    if-ge v1, p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lxx;->c:Ljava/util/ArrayList;

    .line 54
    .line 55
    new-instance v3, Ljava/io/File;

    .line 56
    .line 57
    iget-object v4, p0, Lxx;->j:Lay;

    .line 58
    .line 59
    iget-object v4, v4, Lay;->j:Ljava/io/File;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    const-string v2, ".tmp"

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lxx;->d:Ljava/util/ArrayList;

    .line 77
    .line 78
    new-instance v3, Ljava/io/File;

    .line 79
    .line 80
    iget-object v4, p0, Lxx;->j:Lay;

    .line 81
    .line 82
    iget-object v4, v4, Lay;->j:Ljava/io/File;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 95
    .line 96
    .line 97
    add-int/lit8 v1, v1, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    return-void
.end method


# virtual methods
.method public final a()Lyx;
    .locals 9

    .line 1
    sget-object v0, Ljg1;->a:[B

    .line 2
    .line 3
    iget-boolean v0, p0, Lxx;->e:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lxx;->j:Lay;

    .line 10
    .line 11
    iget-boolean v1, v0, Lay;->t:Z

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lxx;->g:Lvx;

    .line 16
    .line 17
    if-nez v1, :cond_5

    .line 18
    .line 19
    iget-boolean v1, p0, Lxx;->f:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lxx;->b:[J

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    move-object v8, v1

    .line 36
    check-cast v8, [J

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    move v2, v1

    .line 40
    :goto_0
    const/4 v3, 0x2

    .line 41
    if-ge v2, v3, :cond_3

    .line 42
    .line 43
    :try_start_0
    iget-object v3, p0, Lxx;->c:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Ljava/io/File;

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    sget-object v4, Lnr0;->a:Ljava/util/logging/Logger;

    .line 55
    .line 56
    new-instance v4, Lna;

    .line 57
    .line 58
    new-instance v5, Ljava/io/FileInputStream;

    .line 59
    .line 60
    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 61
    .line 62
    .line 63
    sget-object v3, Lnc1;->d:Lmc1;

    .line 64
    .line 65
    invoke-direct {v4, v5, v3}, Lna;-><init>(Ljava/io/InputStream;Lnc1;)V

    .line 66
    .line 67
    .line 68
    iget-boolean v3, v0, Lay;->t:Z

    .line 69
    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    iget v3, p0, Lxx;->h:I

    .line 74
    .line 75
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    iput v3, p0, Lxx;->h:I

    .line 78
    .line 79
    new-instance v3, Lwx;

    .line 80
    .line 81
    invoke-direct {v3, v4, v0, p0}, Lwx;-><init>(Lna;Lay;Lxx;)V

    .line 82
    .line 83
    .line 84
    move-object v4, v3

    .line 85
    :goto_1
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    add-int/lit8 v2, v2, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_3
    new-instance v2, Lyx;

    .line 92
    .line 93
    iget-object v3, p0, Lxx;->j:Lay;

    .line 94
    .line 95
    iget-object v4, p0, Lxx;->a:Ljava/lang/String;

    .line 96
    .line 97
    iget-wide v5, p0, Lxx;->i:J

    .line 98
    .line 99
    invoke-direct/range {v2 .. v8}, Lyx;-><init>(Lay;Ljava/lang/String;JLjava/util/ArrayList;[J)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    return-object v2

    .line 103
    :catch_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    :goto_2
    if-ge v1, v2, :cond_4

    .line 108
    .line 109
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    add-int/lit8 v1, v1, 0x1

    .line 114
    .line 115
    check-cast v3, Lp81;

    .line 116
    .line 117
    invoke-static {v3}, Ljg1;->b(Ljava/io/Closeable;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_4
    :try_start_1
    invoke-virtual {v0, p0}, Lay;->x(Lxx;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 122
    .line 123
    .line 124
    :catch_1
    :cond_5
    :goto_3
    const/4 p0, 0x0

    .line 125
    return-object p0
.end method
