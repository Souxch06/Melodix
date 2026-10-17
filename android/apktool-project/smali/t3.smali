.class public final Lt3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljavax/net/SocketFactory;

.field public final b:Ljavax/net/ssl/SSLSocketFactory;

.field public final c:Ljavax/net/ssl/HostnameVerifier;

.field public final d:Lij;

.field public final e:Ljava/net/ProxySelector;

.field public final f:Led0;

.field public final g:Ljava/util/List;

.field public final h:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lij;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Lt3;->a:Ljavax/net/SocketFactory;

    .line 17
    .line 18
    iput-object p4, p0, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 19
    .line 20
    iput-object p5, p0, Lt3;->c:Ljavax/net/ssl/HostnameVerifier;

    .line 21
    .line 22
    iput-object p6, p0, Lt3;->d:Lij;

    .line 23
    .line 24
    iput-object p9, p0, Lt3;->e:Ljava/net/ProxySelector;

    .line 25
    .line 26
    new-instance p3, Ldd0;

    .line 27
    .line 28
    invoke-direct {p3}, Ldd0;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string p5, "http"

    .line 32
    .line 33
    const-string p6, "https"

    .line 34
    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    move-object p4, p6

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move-object p4, p5

    .line 40
    :goto_0
    invoke-virtual {p4, p5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p9

    .line 44
    const/4 v0, 0x0

    .line 45
    if-eqz p9, :cond_1

    .line 46
    .line 47
    iput-object p5, p3, Ldd0;->a:Ljava/lang/String;

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {p4, p6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p5

    .line 54
    if-eqz p5, :cond_4

    .line 55
    .line 56
    iput-object p6, p3, Ldd0;->a:Ljava/lang/String;

    .line 57
    .line 58
    :goto_1
    const/4 p4, 0x7

    .line 59
    const/4 p5, 0x0

    .line 60
    invoke-static {p5, p5, p4, p1}, Lok0;->u(IIILjava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    invoke-static {p4}, Lxg;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    if-eqz p4, :cond_3

    .line 69
    .line 70
    iput-object p4, p3, Ldd0;->d:Ljava/lang/String;

    .line 71
    .line 72
    const/4 p1, 0x1

    .line 73
    if-gt p1, p2, :cond_2

    .line 74
    .line 75
    const/high16 p1, 0x10000

    .line 76
    .line 77
    if-ge p2, p1, :cond_2

    .line 78
    .line 79
    iput p2, p3, Ldd0;->e:I

    .line 80
    .line 81
    invoke-virtual {p3}, Ldd0;->a()Led0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lt3;->f:Led0;

    .line 86
    .line 87
    invoke-static {p7}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lt3;->g:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {p8}, Ljg1;->q(Ljava/util/List;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lt3;->h:Ljava/util/List;

    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    const-string p0, "unexpected port: "

    .line 101
    .line 102
    invoke-static {p2, p0}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lz0;->b(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    throw v0

    .line 110
    :cond_3
    const-string p0, "unexpected host: "

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw v0

    .line 120
    :cond_4
    const-string p0, "unexpected scheme: "

    .line 121
    .line 122
    invoke-virtual {p0, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    throw v0
.end method


# virtual methods
.method public final a(Lt3;)Z
    .locals 2

    .line 1
    sget-object v0, Ltb0;->k:Ltb0;

    .line 2
    .line 3
    iget-object v0, p0, Lt3;->g:Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p1, Lt3;->g:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lt3;->h:Ljava/util/List;

    .line 14
    .line 15
    iget-object v1, p1, Lt3;->h:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lt3;->e:Ljava/net/ProxySelector;

    .line 24
    .line 25
    iget-object v1, p1, Lt3;->e:Ljava/net/ProxySelector;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 34
    .line 35
    iget-object v1, p1, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Lt3;->c:Ljavax/net/ssl/HostnameVerifier;

    .line 44
    .line 45
    iget-object v1, p1, Lt3;->c:Ljavax/net/ssl/HostnameVerifier;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Lt3;->d:Lij;

    .line 54
    .line 55
    iget-object v1, p1, Lt3;->d:Lij;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-object p0, p0, Lt3;->f:Led0;

    .line 64
    .line 65
    iget p0, p0, Led0;->e:I

    .line 66
    .line 67
    iget-object p1, p1, Lt3;->f:Led0;

    .line 68
    .line 69
    iget p1, p1, Led0;->e:I

    .line 70
    .line 71
    if-ne p0, p1, :cond_0

    .line 72
    .line 73
    const/4 p0, 0x1

    .line 74
    return p0

    .line 75
    :cond_0
    const/4 p0, 0x0

    .line 76
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lt3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lt3;

    .line 6
    .line 7
    iget-object v0, p1, Lt3;->f:Led0;

    .line 8
    .line 9
    iget-object v1, p0, Lt3;->f:Led0;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Led0;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lt3;->a(Lt3;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lt3;->f:Led0;

    .line 2
    .line 3
    iget-object v0, v0, Led0;->h:Ljava/lang/String;

    .line 4
    .line 5
    const/16 v1, 0x20f

    .line 6
    .line 7
    const/16 v2, 0x1f

    .line 8
    .line 9
    invoke-static {v1, v2, v0}, Loq;->d(IILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, Ltb0;->l:Ltb0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v1, v0

    .line 20
    mul-int/2addr v1, v2

    .line 21
    sget-object v0, Ltb0;->k:Ltb0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr v0, v1

    .line 28
    mul-int/2addr v0, v2

    .line 29
    iget-object v1, p0, Lt3;->g:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v1, v0

    .line 36
    mul-int/2addr v1, v2

    .line 37
    iget-object v0, p0, Lt3;->h:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr v0, v1

    .line 44
    mul-int/2addr v0, v2

    .line 45
    iget-object v1, p0, Lt3;->e:Ljava/net/ProxySelector;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v1, v0

    .line 52
    mul-int/lit16 v1, v1, 0x3c1

    .line 53
    .line 54
    iget-object v0, p0, Lt3;->b:Ljavax/net/ssl/SSLSocketFactory;

    .line 55
    .line 56
    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    add-int/2addr v0, v1

    .line 61
    mul-int/2addr v0, v2

    .line 62
    iget-object v1, p0, Lt3;->c:Ljavax/net/ssl/HostnameVerifier;

    .line 63
    .line 64
    invoke-static {v1}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int/2addr v1, v0

    .line 69
    mul-int/2addr v1, v2

    .line 70
    iget-object p0, p0, Lt3;->d:Lij;

    .line 71
    .line 72
    invoke-static {p0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    add-int/2addr p0, v1

    .line 77
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Address{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lt3;->f:Led0;

    .line 9
    .line 10
    iget-object v2, v1, Led0;->d:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const/16 v2, 0x3a

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v1, v1, Led0;->e:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, ", "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "proxySelector="

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lt3;->e:Ljava/net/ProxySelector;

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const/16 p0, 0x7d

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method
