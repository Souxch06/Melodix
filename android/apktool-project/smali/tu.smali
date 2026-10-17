.class public final Ltu;
.super Lih0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lr80;


# instance fields
.field public final synthetic k:I

.field public final synthetic l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Ltu;->k:I

    .line 2
    .line 3
    iput-object p2, p0, Ltu;->l:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p1}, Lih0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Ltu;->k:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljava/io/File;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v0, Lno0;

    .line 12
    .line 13
    iget-object p0, p0, Ltu;->l:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Lgq;

    .line 16
    .line 17
    iget-object p0, p0, Lgq;->j:Lsq;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1}, Lno0;-><init>(Lsq;Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :pswitch_0
    check-cast p1, Ljava/io/IOException;

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ltu;->l:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p0, Lay;

    .line 31
    .line 32
    sget-object p1, Ljg1;->a:[B

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lay;->s:Z

    .line 36
    .line 37
    sget-object p0, Lwe1;->a:Lwe1;

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_1
    check-cast p1, Ljava/lang/Throwable;

    .line 41
    .line 42
    iget-object p0, p0, Ltu;->l:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, Lwu;

    .line 45
    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lwu;->h:Lbv1;

    .line 49
    .line 50
    new-instance v1, Lp30;

    .line 51
    .line 52
    invoke-direct {v1, p1}, Lp30;-><init>(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lbv1;->r(Lr91;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Lwu;->j:Lgb1;

    .line 59
    .line 60
    iget-object p1, p1, Lgb1;->k:Ljava/lang/Object;

    .line 61
    .line 62
    sget-object v0, Lmz;->q:Lmz;

    .line 63
    .line 64
    if-eq p1, v0, :cond_1

    .line 65
    .line 66
    iget-object p0, p0, Lwu;->j:Lgb1;

    .line 67
    .line 68
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Lk30;

    .line 73
    .line 74
    invoke-virtual {p0}, Lk30;->close()V

    .line 75
    .line 76
    .line 77
    :cond_1
    sget-object p0, Lwe1;->a:Lwe1;

    .line 78
    .line 79
    return-object p0

    .line 80
    nop

    .line 81
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
