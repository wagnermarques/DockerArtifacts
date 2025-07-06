import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FzlCard } from './fzl-card';

describe('FzlCard', () => {
  let component: FzlCard;
  let fixture: ComponentFixture<FzlCard>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FzlCard]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FzlCard);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
