.class public final Loi;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lny0;

.field public final synthetic k:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Lny0;Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Loi;->j:Lny0;

    .line 5
    .line 6
    iput-object p2, p0, Loi;->k:Landroid/graphics/Typeface;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Loi;->j:Lny0;

    .line 2
    .line 3
    iget-object v0, v0, Lny0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lk8;

    .line 6
    .line 7
    iget-object p0, p0, Loi;->k:Landroid/graphics/Typeface;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lk8;->b(Landroid/graphics/Typeface;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
