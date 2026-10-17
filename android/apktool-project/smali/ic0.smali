.class public final Lic0;
.super Lfc0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public m:Z


# virtual methods
.method public final c(JLeh;)J
    .locals 2

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lfc0;->k:Z

    .line 5
    .line 6
    if-nez p1, :cond_2

    .line 7
    .line 8
    iget-boolean p1, p0, Lic0;->m:Z

    .line 9
    .line 10
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return-wide v0

    .line 15
    :cond_0
    const-wide/16 p1, 0x2000

    .line 16
    .line 17
    invoke-super {p0, p1, p2, p3}, Lfc0;->c(JLeh;)J

    .line 18
    .line 19
    .line 20
    move-result-wide p1

    .line 21
    cmp-long p3, p1, v0

    .line 22
    .line 23
    if-nez p3, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lic0;->m:Z

    .line 27
    .line 28
    invoke-virtual {p0}, Lfc0;->a()V

    .line 29
    .line 30
    .line 31
    return-wide v0

    .line 32
    :cond_1
    return-wide p1

    .line 33
    :cond_2
    const-string p0, "closed"

    .line 34
    .line 35
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-wide/16 p0, 0x0

    .line 39
    .line 40
    return-wide p0
.end method

.method public final close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lfc0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lic0;->m:Z

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lfc0;->a()V

    .line 11
    .line 12
    .line 13
    :cond_1
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lfc0;->k:Z

    .line 15
    .line 16
    return-void
.end method
