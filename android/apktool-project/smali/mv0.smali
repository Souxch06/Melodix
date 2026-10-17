.class public final Lmv0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lci0;


# static fields
.field public static final r:Lmv0;


# instance fields
.field public j:I

.field public k:I

.field public l:Z

.field public m:Z

.field public n:Landroid/os/Handler;

.field public final o:Landroidx/lifecycle/a;

.field public final p:La3;

.field public final q:Lvd2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lmv0;

    .line 2
    .line 3
    invoke-direct {v0}, Lmv0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lmv0;->r:Lmv0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lmv0;->l:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lmv0;->m:Z

    .line 8
    .line 9
    new-instance v0, Landroidx/lifecycle/a;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(Lci0;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lmv0;->o:Landroidx/lifecycle/a;

    .line 15
    .line 16
    new-instance v0, La3;

    .line 17
    .line 18
    const/4 v1, 0x7

    .line 19
    invoke-direct {v0, v1, p0}, La3;-><init>(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lmv0;->p:La3;

    .line 23
    .line 24
    new-instance v0, Lvd2;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Lvd2;-><init>(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lmv0;->q:Lvd2;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 2

    .line 1
    iget v0, p0, Lmv0;->k:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lmv0;->k:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lmv0;->l:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lmv0;->o:Landroidx/lifecycle/a;

    .line 14
    .line 15
    sget-object v1, Lvh0;->ON_RESUME:Lvh0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->d(Lvh0;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lmv0;->l:Z

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lmv0;->n:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lmv0;->p:La3;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final e()Landroidx/lifecycle/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lmv0;->o:Landroidx/lifecycle/a;

    .line 2
    .line 3
    return-object p0
.end method
