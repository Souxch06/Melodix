.class public final Lv41;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lm41;


# instance fields
.field public final j:Le51;


# direct methods
.method public constructor <init>(Le51;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lv41;->j:Le51;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lu41;

    .line 2
    .line 3
    iget-object p0, p0, Lv41;->j:Le51;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1}, Le51;->a(Ly41;)Ly41;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-direct {v0, p0, v1, v1}, Lu41;-><init>(Ly41;Ljc1;Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final g(Ljava/lang/Object;Lre1;)V
    .locals 1

    .line 1
    check-cast p1, Lu41;

    .line 2
    .line 3
    sget-object p0, Lpg0;->d:Lpg0;

    .line 4
    .line 5
    sget-object v0, Lu41;->Companion:Lt41;

    .line 6
    .line 7
    invoke-virtual {v0}, Lt41;->serializer()Ldh0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0, p1}, Lpg0;->b(Ldh0;Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object p1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iget-object p1, p2, Lre1;->j:Ljava/io/FileOutputStream;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final i(Ljava/io/FileInputStream;)Ljava/lang/Object;
    .locals 2

    .line 1
    :try_start_0
    sget-object p0, Lpg0;->d:Lpg0;

    .line 2
    .line 3
    invoke-static {p1}, Lcg1;->p(Ljava/io/InputStream;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/String;

    .line 8
    .line 9
    sget-object v1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 10
    .line 11
    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lpg0;->b:Ltb0;

    .line 15
    .line 16
    sget-object p1, Lu41;->Companion:Lt41;

    .line 17
    .line 18
    invoke-virtual {p1}, Lt41;->serializer()Ldh0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1, v0}, Lpg0;->a(Ldh0;Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lu41;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    return-object p0

    .line 29
    :catch_0
    move-exception p0

    .line 30
    new-instance p1, Ler;

    .line 31
    .line 32
    const-string v0, "Cannot parse session data"

    .line 33
    .line 34
    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    throw p1
.end method
