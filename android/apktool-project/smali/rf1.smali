.class public final synthetic Lrf1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Landroid/widget/ProgressBar;

.field public final synthetic k:Z

.field public final synthetic l:Landroid/content/res/ColorStateList;

.field public final synthetic m:Landroid/content/res/ColorStateList;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrf1;->j:Landroid/widget/ProgressBar;

    .line 5
    .line 6
    iput-boolean p2, p0, Lrf1;->k:Z

    .line 7
    .line 8
    iput-object p3, p0, Lrf1;->l:Landroid/content/res/ColorStateList;

    .line 9
    .line 10
    iput-object p4, p0, Lrf1;->m:Landroid/content/res/ColorStateList;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    iget-object v1, p0, Lrf1;->j:Landroid/widget/ProgressBar;

    .line 3
    .line 4
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Lrf1;->k:Z

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 10
    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lrf1;->l:Landroid/content/res/ColorStateList;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lrf1;->m:Landroid/content/res/ColorStateList;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
