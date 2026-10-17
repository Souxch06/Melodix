.class public final Li50;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljw0;


# instance fields
.field public final synthetic j:I

.field public final k:Lbv1;

.field public final l:Ljw0;


# direct methods
.method public synthetic constructor <init>(Lbv1;Ljw0;I)V
    .locals 0

    .line 12
    iput p3, p0, Li50;->j:I

    iput-object p1, p0, Li50;->k:Lbv1;

    iput-object p2, p0, Li50;->l:Ljw0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljw0;Lbv1;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Li50;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Li50;->l:Ljw0;

    .line 8
    .line 9
    iput-object p2, p0, Li50;->k:Lbv1;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Li50;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Li50;->k:Lbv1;

    .line 4
    .line 5
    iget-object p0, p0, Li50;->l:Ljw0;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lv9;

    .line 15
    .line 16
    iget-object v0, v1, Lbv1;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Lsq;

    .line 19
    .line 20
    new-instance v1, Le01;

    .line 21
    .line 22
    invoke-direct {v1, p0, v0}, Le01;-><init>(Lv9;Lsq;)V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :pswitch_0
    iget-object v0, v1, Lbv1;->k:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Landroid/content/Context;

    .line 29
    .line 30
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lmg1;

    .line 35
    .line 36
    new-instance v1, Liv0;

    .line 37
    .line 38
    invoke-direct {v1, v0, p0}, Liv0;-><init>(Landroid/content/Context;Lmg1;)V

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :pswitch_1
    iget-object v0, v1, Lbv1;->k:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v0, Landroid/content/Context;

    .line 45
    .line 46
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lsq;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    sget-object v1, Ltb0;->p:Ltb0;

    .line 59
    .line 60
    new-instance v2, Lpa0;

    .line 61
    .line 62
    new-instance v3, Lq4;

    .line 63
    .line 64
    const/4 v4, 0x3

    .line 65
    invoke-direct {v3, v4}, Lq4;-><init>(I)V

    .line 66
    .line 67
    .line 68
    const/16 v4, 0x15

    .line 69
    .line 70
    invoke-direct {v2, v4, v3}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p0}, Lfe1;->b(Lsq;)Lgq;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v3, Lg50;

    .line 78
    .line 79
    const/4 v4, 0x0

    .line 80
    invoke-direct {v3, v0, v4}, Lg50;-><init>(Landroid/content/Context;I)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v2, p0, v3}, Lt11;->j(Lm41;Lpa0;Lgq;Lp80;)Lwu;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0

    .line 88
    nop

    .line 89
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
