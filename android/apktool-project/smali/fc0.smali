.class public abstract Lfc0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lp81;


# instance fields
.field public final j:Ld70;

.field public k:Z

.field public final synthetic l:Ljc0;


# direct methods
.method public constructor <init>(Ljc0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lfc0;->l:Ljc0;

    .line 5
    .line 6
    new-instance v0, Ld70;

    .line 7
    .line 8
    iget-object p1, p1, Ljc0;->c:Llh;

    .line 9
    .line 10
    invoke-interface {p1}, Lp81;->b()Lnc1;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, v0, Ld70;->e:Lnc1;

    .line 21
    .line 22
    iput-object v0, p0, Lfc0;->j:Ld70;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lfc0;->l:Ljc0;

    .line 2
    .line 3
    iget v1, v0, Ljc0;->e:I

    .line 4
    .line 5
    const/4 v2, 0x6

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v3, 0x5

    .line 10
    if-ne v1, v3, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lfc0;->j:Ld70;

    .line 13
    .line 14
    iget-object v1, p0, Ld70;->e:Lnc1;

    .line 15
    .line 16
    sget-object v3, Lnc1;->d:Lmc1;

    .line 17
    .line 18
    iput-object v3, p0, Ld70;->e:Lnc1;

    .line 19
    .line 20
    invoke-virtual {v1}, Lnc1;->a()Lnc1;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Lnc1;->b()Lnc1;

    .line 24
    .line 25
    .line 26
    iput v2, v0, Ljc0;->e:I

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 30
    .line 31
    iget v0, v0, Ljc0;->e:I

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "state: "

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p0
.end method

.method public final b()Lnc1;
    .locals 0

    .line 1
    iget-object p0, p0, Lfc0;->j:Ld70;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(JLeh;)J
    .locals 2

    .line 1
    iget-object v0, p0, Lfc0;->l:Ljc0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v1, v0, Ljc0;->c:Llh;

    .line 7
    .line 8
    invoke-interface {v1, p1, p2, p3}, Lp81;->c(JLeh;)J

    .line 9
    .line 10
    .line 11
    move-result-wide p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return-wide p0

    .line 13
    :catch_0
    move-exception p1

    .line 14
    iget-object p2, v0, Ljc0;->b:Lzx0;

    .line 15
    .line 16
    invoke-virtual {p2}, Lzx0;->k()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lfc0;->a()V

    .line 20
    .line 21
    .line 22
    throw p1
.end method
