.class public final Lkl1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lml1;


# direct methods
.method public constructor <init>(Lml1;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lkl1;->k:Lml1;

    .line 5
    .line 6
    iput p2, p0, Lkl1;->j:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lkl1;->k:Lml1;

    .line 2
    .line 3
    iget p0, p0, Lkl1;->j:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lml1;->i(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
