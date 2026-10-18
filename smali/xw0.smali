.class public final Lxw0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements La30;


# static fields
.field public static final l:Ljava/nio/charset/Charset;


# instance fields
.field public final j:Ljava/io/File;

.field public k:Lww0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lxw0;->l:Ljava/nio/charset/Charset;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lxw0;->j:Ljava/io/File;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lxw0;->k:Lww0;

    .line 2
    .line 3
    invoke-static {v0}, Lml;->i(Ljava/io/Closeable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lxw0;->k:Lww0;

    .line 8
    .line 9
    return-void
.end method

.method public final f()Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Lxw0;->j:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    :goto_0
    move-object p0, v3

    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v1, p0, Lxw0;->k:Lww0;

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    :try_start_0
    new-instance v1, Lww0;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lww0;-><init>(Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lxw0;->k:Lww0;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :catch_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_1
    iget-object v0, p0, Lxw0;->k:Lww0;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    filled-new-array {v2}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0}, Lww0;->v()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    new-array v0, v0, [B

    .line 42
    .line 43
    :try_start_1
    iget-object p0, p0, Lxw0;->k:Lww0;

    .line 44
    .line 45
    new-instance v4, Lxn0;

    .line 46
    .line 47
    const/16 v5, 0xa

    .line 48
    .line 49
    invoke-direct {v4, v0, v5, v1}, Lxn0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v4}, Lww0;->h(Lvw0;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 53
    .line 54
    .line 55
    :catch_1
    new-instance p0, Lf4;

    .line 56
    .line 57
    aget v1, v1, v2

    .line 58
    .line 59
    invoke-direct {p0, v1, v0}, Lf4;-><init>(I[B)V

    .line 60
    .line 61
    .line 62
    :goto_2
    if-nez p0, :cond_3

    .line 63
    .line 64
    move-object v1, v3

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    iget v0, p0, Lf4;->b:I

    .line 67
    .line 68
    new-array v1, v0, [B

    .line 69
    .line 70
    iget-object p0, p0, Lf4;->c:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast p0, [B

    .line 73
    .line 74
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    :goto_3
    if-eqz v1, :cond_4

    .line 78
    .line 79
    new-instance p0, Ljava/lang/String;

    .line 80
    .line 81
    sget-object v0, Lxw0;->l:Ljava/nio/charset/Charset;

    .line 82
    .line 83
    invoke-direct {p0, v1, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 84
    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_4
    return-object v3
.end method

.method public final j(Ljava/lang/String;J)V
    .locals 4

    .line 1
    iget-object v0, p0, Lxw0;->j:Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lxw0;->k:Lww0;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    :try_start_0
    new-instance v1, Lww0;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Lww0;-><init>(Ljava/io/File;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lxw0;->k:Lww0;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    const-string v0, " "

    .line 19
    .line 20
    const-string v1, "..."

    .line 21
    .line 22
    iget-object v2, p0, Lxw0;->k:Lww0;

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/16 v3, 0x4000

    .line 32
    .line 33
    if-le v2, v3, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sub-int/2addr v2, v3

    .line 40
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :cond_2
    const-string v1, "\r"

    .line 49
    .line 50
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v1, "\n"

    .line 55
    .line 56
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 61
    .line 62
    const-string v1, "%d %s%n"

    .line 63
    .line 64
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    sget-object p2, Lxw0;->l:Ljava/nio/charset/Charset;

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p2, p0, Lxw0;->k:Lww0;

    .line 83
    .line 84
    invoke-virtual {p2, p1}, Lww0;->a([B)V

    .line 85
    .line 86
    .line 87
    :goto_1
    iget-object p1, p0, Lxw0;->k:Lww0;

    .line 88
    .line 89
    invoke-virtual {p1}, Lww0;->j()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_3

    .line 94
    .line 95
    iget-object p1, p0, Lxw0;->k:Lww0;

    .line 96
    .line 97
    invoke-virtual {p1}, Lww0;->v()I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    const/high16 p2, 0x10000

    .line 102
    .line 103
    if-le p1, p2, :cond_3

    .line 104
    .line 105
    iget-object p1, p0, Lxw0;->k:Lww0;

    .line 106
    .line 107
    invoke-virtual {p1}, Lww0;->s()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :catch_1
    :cond_3
    :goto_2
    return-void
.end method
