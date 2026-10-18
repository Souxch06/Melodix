.class public final Lrx0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lkh;


# instance fields
.field public final j:La81;

.field public final k:Leh;

.field public l:Z


# direct methods
.method public constructor <init>(La81;)V
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
    iput-object p1, p0, Lrx0;->j:La81;

    .line 8
    .line 9
    new-instance p1, Leh;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lrx0;->k:Leh;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Lkh;
    .locals 8

    .line 1
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 6
    .line 7
    iget-wide v1, v0, Leh;->k:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v5, v1, v3

    .line 12
    .line 13
    if-nez v5, :cond_0

    .line 14
    .line 15
    move-wide v1, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v5, v0, Leh;->j:Lp31;

    .line 18
    .line 19
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v5, v5, Lp31;->g:Lp31;

    .line 23
    .line 24
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    iget v6, v5, Lp31;->c:I

    .line 28
    .line 29
    const/16 v7, 0x2000

    .line 30
    .line 31
    if-ge v6, v7, :cond_1

    .line 32
    .line 33
    iget-boolean v7, v5, Lp31;->e:Z

    .line 34
    .line 35
    if-eqz v7, :cond_1

    .line 36
    .line 37
    iget v5, v5, Lp31;->b:I

    .line 38
    .line 39
    sub-int/2addr v6, v5

    .line 40
    int-to-long v5, v6

    .line 41
    sub-long/2addr v1, v5

    .line 42
    :cond_1
    :goto_0
    cmp-long v3, v1, v3

    .line 43
    .line 44
    if-lez v3, :cond_2

    .line 45
    .line 46
    iget-object v3, p0, Lrx0;->j:La81;

    .line 47
    .line 48
    invoke-interface {v3, v1, v2, v0}, La81;->i(JLeh;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-object p0

    .line 52
    :cond_3
    const-string p0, "closed"

    .line 53
    .line 54
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return-object p0
.end method

.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lrx0;->j:La81;

    .line 2
    .line 3
    invoke-interface {p0}, La81;->b()Lnc1;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final close()V
    .locals 6

    .line 1
    iget-object v0, p0, Lrx0;->j:La81;

    .line 2
    .line 3
    iget-boolean v1, p0, Lrx0;->l:Z

    .line 4
    .line 5
    if-nez v1, :cond_3

    .line 6
    .line 7
    :try_start_0
    iget-object v1, p0, Lrx0;->k:Leh;

    .line 8
    .line 9
    iget-wide v2, v1, Leh;->k:J

    .line 10
    .line 11
    const-wide/16 v4, 0x0

    .line 12
    .line 13
    cmp-long v4, v2, v4

    .line 14
    .line 15
    if-lez v4, :cond_0

    .line 16
    .line 17
    invoke-interface {v0, v2, v3, v1}, La81;->i(JLeh;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 24
    :goto_1
    :try_start_1
    invoke-interface {v0}, La81;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 25
    .line 26
    .line 27
    goto :goto_2

    .line 28
    :catchall_1
    move-exception v0

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    move-object v1, v0

    .line 32
    :cond_1
    :goto_2
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Lrx0;->l:Z

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_2
    throw v1

    .line 39
    :cond_3
    :goto_3
    return-void
.end method

.method public final flush()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 6
    .line 7
    iget-wide v1, v0, Leh;->k:J

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v3, v1, v3

    .line 12
    .line 13
    iget-object p0, p0, Lrx0;->j:La81;

    .line 14
    .line 15
    if-lez v3, :cond_0

    .line 16
    .line 17
    invoke-interface {p0, v1, v2, v0}, La81;->i(JLeh;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-interface {p0}, La81;->flush()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const-string p0, "closed"

    .line 25
    .line 26
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final i(JLeh;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2, p3}, Leh;->i(JLeh;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "closed"

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final isOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public final m(Lth;)Lkh;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Leh;->x(Lth;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "closed"

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final o(Ljava/lang/String;)Lkh;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Leh;->F(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "closed"

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final p(J)Lkh;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Leh;->A(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "closed"

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "buffer("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lrx0;->j:La81;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x29

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final write(Ljava/nio/ByteBuffer;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Leh;->write(Ljava/nio/ByteBuffer;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 15
    .line 16
    .line 17
    return p1

    .line 18
    :cond_0
    const-string p0, "closed"

    .line 19
    .line 20
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final write([B)Lkh;
    .locals 2

    .line 25
    iget-boolean v0, p0, Lrx0;->l:Z

    if-nez v0, :cond_0

    .line 26
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 27
    array-length v1, p1

    invoke-virtual {v0, v1, p1}, Leh;->w(I[B)V

    .line 28
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    return-object p0

    .line 29
    :cond_0
    const-string p0, "closed"

    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final writeByte(I)Lkh;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Leh;->z(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "closed"

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final writeInt(I)Lkh;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Leh;->C(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "closed"

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final writeShort(I)Lkh;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx0;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lrx0;->k:Leh;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Leh;->D(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lrx0;->a()Lkh;

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "closed"

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method
