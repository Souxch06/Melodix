.class public abstract Lkm0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Landroid/adservices/measurement/MeasurementManager;


# direct methods
.method public constructor <init>(Landroid/adservices/measurement/MeasurementManager;)V
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
    iput-object p1, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 8
    .line 9
    return-void
.end method

.method public static b(Lkm0;Lyw;Liq;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Lyw;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance p1, Lvi;

    .line 2
    .line 3
    invoke-static {p2}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p1, v0, p2}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method

.method public static d(Lkm0;Liq;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, Lvi;

    .line 2
    .line 3
    invoke-static {p1}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1, p1}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 15
    .line 16
    new-instance p1, Ljm0;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Llq;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Llq;-><init>(Lvi;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p1, v1}, Lri0;->g(Landroid/adservices/measurement/MeasurementManager;Ljm0;Landroid/os/OutcomeReceiver;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lvi;->s()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static g(Lkm0;Lq81;Liq;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Lq81;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance p1, Lgu;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x2

    .line 5
    invoke-direct {p1, p0, v0, v1}, Lgu;-><init>(Ljava/lang/Object;Liq;I)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lh31;

    .line 9
    .line 10
    invoke-interface {p2}, Liq;->getContext()Lsq;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p0, p2, v0}, Lh31;-><init>(Liq;Lsq;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, p0, p1}, Lkp1;->g(Lh31;Lh31;Lf90;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object p1, Lar;->j:Lar;

    .line 22
    .line 23
    if-ne p0, p1, :cond_0

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 27
    .line 28
    return-object p0
.end method

.method public static h(Lkm0;Landroid/net/Uri;Landroid/view/InputEvent;Liq;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Landroid/net/Uri;",
            "Landroid/view/InputEvent;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, Lvi;

    .line 2
    .line 3
    invoke-static {p3}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1, p3}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 15
    .line 16
    new-instance p3, Ljm0;

    .line 17
    .line 18
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Llq;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Llq;-><init>(Lvi;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p1, p2, p3, v1}, Lri0;->i(Landroid/adservices/measurement/MeasurementManager;Landroid/net/Uri;Landroid/view/InputEvent;Ljm0;Landroid/os/OutcomeReceiver;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lvi;->s()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object p1, Lar;->j:Lar;

    .line 34
    .line 35
    if-ne p0, p1, :cond_0

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 39
    .line 40
    return-object p0
.end method

.method public static j(Lkm0;Landroid/net/Uri;Liq;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Landroid/net/Uri;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, Lvi;

    .line 2
    .line 3
    invoke-static {p2}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1, p2}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 15
    .line 16
    new-instance p2, Ljm0;

    .line 17
    .line 18
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Llq;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Llq;-><init>(Lvi;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, p1, p2, v1}, Lri0;->h(Landroid/adservices/measurement/MeasurementManager;Landroid/net/Uri;Ljm0;Landroid/os/OutcomeReceiver;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lvi;->s()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object p1, Lar;->j:Lar;

    .line 34
    .line 35
    if-ne p0, p1, :cond_0

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 39
    .line 40
    return-object p0
.end method

.method public static l(Lkm0;Lej1;Liq;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Lej1;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance p1, Lvi;

    .line 2
    .line 3
    invoke-static {p2}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p1, v0, p2}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method

.method public static n(Lkm0;Lfj1;Liq;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkm0;",
            "Lfj1;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance p1, Lvi;

    .line 2
    .line 3
    invoke-static {p2}, Lqe0;->i(Liq;)Liq;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-direct {p1, v0, p2}, Lvi;-><init>(ILiq;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lvi;->t()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lkm0;->a:Landroid/adservices/measurement/MeasurementManager;

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    throw p0
.end method


# virtual methods
.method public a(Lyw;Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lyw;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lkm0;->b(Lkm0;Lyw;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lkm0;->d(Lkm0;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lq81;Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lq81;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lkm0;->g(Lkm0;Lq81;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Landroid/net/Uri;Landroid/view/InputEvent;Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Landroid/view/InputEvent;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2, p3}, Lkm0;->h(Lkm0;Landroid/net/Uri;Landroid/view/InputEvent;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Landroid/net/Uri;Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lkm0;->j(Lkm0;Landroid/net/Uri;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Lej1;Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lej1;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lkm0;->l(Lkm0;Lej1;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Lfj1;Liq;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lfj1;",
            "Liq;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Lkm0;->n(Lkm0;Lfj1;Liq;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
