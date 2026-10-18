.class public final Lf60;
.super Lkq;


# instance fields
.field public m:Lb60;

.field public synthetic n:Ljava/lang/Object;

.field public o:I

.field public final synthetic p:Lb60;

.field public q:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lb60;Liq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lf60;->p:Lb60;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lkq;-><init>(Liq;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, Lf60;->n:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lf60;->o:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lf60;->o:I

    .line 9
    .line 10
    iget-object p1, p0, Lf60;->p:Lb60;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, Lb60;->h(Ljava/lang/Object;Liq;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
